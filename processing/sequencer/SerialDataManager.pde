import java.util.*;
import java.util.concurrent.*;

public class SerialDataManager {
	byte[] serialBytes = new byte[1024];
	ArrayList<Byte> buffer = new ArrayList<Byte>();

	// Data that comes in from serial, which is placed into the buffer
	public synchronized void readSerial() {
		// println("readSerial()");
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
				// println("Byte index: " + index);
				updateByteInput(index, v0);
			}
			// Analog input bytes
			else if (index >= 14 && index < 35) {
				// updateAnalog(index);
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
				serialDataManager.readSerial();
			}
		}
	}
}