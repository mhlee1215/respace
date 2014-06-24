package com.respace.web;

class UpdateSemaphore {
	
	boolean isHaveUpdate = false;
	
	public UpdateSemaphore() {
	}

	public synchronized void waitUntilUpdate() throws InterruptedException {
		while (!isHaveUpdate) {
			this.wait();
		}
	}

	public synchronized void notifyUpdate() throws InterruptedException {
		isHaveUpdate = true;
		this.notifyAll();
	}
	
	public synchronized void setNoUpdate(){
		this.isHaveUpdate = false;
	}
}