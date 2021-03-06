import java.util.*;
import java.util.concurrent.*;

public class SerialDataManager {
	byte[] serialBytes = new byte[8192];
	ArrayList<Byte> buffer = new ArrayList<Byte>();
	boolean isLocked = false;

	// Data that comes in from serial, which is placed into the buffer
	public synchronized void readSerial() {
		int nBytesAvailable = port.available();

		if (nBytesAvailable > 0) {
		    serialBytes = port.readBytes();

		    for (int i = 0; i < nBytesAvailable; i++) {
		      buffer.add((byte) serialBytes[i]);
		      serialBytes[i] = 0;
		    }
		}
	}

	// Buffer data to be applied to sketch in Processing loop.
	public synchronized void readBuffer() {
		while (buffer.size() > 2) {
			byte index = buffer.remove(0);
			byte v0 = buffer.remove(0);
			byte v1 = buffer.remove(0);

			// Digital input bytes
			if (index < 14 && index >= 0) {
				updateByteInput(index, v0);
			}
			// Analog input bytes
			else if (index >= 14 && index < 35) {
				if (frameCount % 5 == 0) {
					updateAnalog(index - 14, ((v0 << 8) & 0xFF00) + (v1 & 0xFF));
				}
			}
		}
	}
}

class SerialDataManagerThread implements Runnable {
	private SerialDataManager serialDataManager;

	SerialDataManagerThread(SerialDataManager serialDataManager) {
		this.serialDataManager = serialDataManager;
	}

	@Override
	public void run() {
		while(true) {
			synchronized(serialDataManager) {
				serialDataManager.isLocked = true;
				serialDataManager.readSerial();
				serialDataManager.isLocked = false;
			}
		}
	}
}