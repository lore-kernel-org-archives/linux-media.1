Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765268;
	b=k5g2eG0HWtBjhcif60lK6lDrSpkD9tDoYx5l7KCUDgt5eOtEJePxghqk1BaLImIAwtcD
	 483IoD4fRG/Yd8RWCq68WaapQlsNNmLFGX+XWPrHZVLqTgUEWWPxplDQUNE8ffJD0eNjV
	 pbhZGQa7PR3Lt173zzhAmrxBYH3VvBB/RQU3u6qxqOVjcaniMEl6aapJRHrmdYPq8/Tso
	 jribXwA7Of1jP2nKKje/0gg6ZnZ6vt1u5zktFYRcIP2cwuuxIQHEVKHwEuI5atVxdzwrQ
	 JXXuzMut8z7qUpQ8KzebHmBE94zzViI+cDUNd76N7NgqQEguOCllkhNX+32rQpzxUtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+9jMIl0zBBhkMlLpSXNkEk0kdLakvxrKv5a1mqHMyfE=;
	b=oBNJBySpLuCdXxJbss/0fzveZVEgHyjGkuhnJU1MDFQO5fWdqzzdl4iGkUKK8v0ZHD06
	 Fl9E4B7KDc78fTVhjOu3kkeZoUoCkoxFd2LaJqDJZUdWOkrADOAd1jAnFC7D1y491eR/5
	 nzeXQLg1PnJhWdKNzrVAu3c9gIzqx08CL6CgVFDhslG6ACImt1bTGOLRdLP7jJ0zmfA1t
	 3o2Wdxnq71QzuuFn7MP4v5m1zq4lRiMs1yNmqzkK8W4jvFJ+bX3SQ2QuyGXPgU/br/nNt
	 ldTyH8tBG+Y8OFH2nH0IYvAGe9uSOSMRlqGZtHIYO0EG0kUB2F9Q6AMnxKq3QFsi9ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weOqlXAm;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB73B606A31A
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 17:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB73B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weOqlXAm
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1217646f8f.0
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 09:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765266; x=1795370066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+9jMIl0zBBhkMlLpSXNkEk0kdLakvxrKv5a1mqHMyfE=;
        b=weOqlXAmKu/o1UvX7BJcnWl2RTSmx4C0EragHBVoDXEmUejMNRuqIvzV633FQXGia8
         2x6LYYrb2qvLkw9j8R37s5RrxmQ5qoGPGgrQIg2doJ5PjVqY3Z1wGGEuE3W8hVxb/NZ0
         TyrvGxE5fWtuzN1TqX2c3ftQhZA5J/ILjx6sdYIl4WfrJdqfm3QV9UuF3cabO5x56PRT
         bQ7wiWXrQMumN6nFZRubv0Th0rgB8HWW4MIEqMPBxG9PmA9hY6Mgi6k0/HZ/2WdM9cfI
         De07y3SqnS4RikxH8hbHOQ9BygLfkx0vlju7YGHCqG/22Pi8c2CEE6E/0utBdPHZmRSJ
         +sLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765266; x=1795370066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9jMIl0zBBhkMlLpSXNkEk0kdLakvxrKv5a1mqHMyfE=;
        b=qD6rYqeoPnYKtbWUbi/HGSC2ZDr0oh7TqDb7+V2P6mRb1Y22uWKPlb6e9DEWYI/CRz
         ZiJteFTZdWL4EgEQYzDVdkmwTcNkfodpWa8E/CAWl+RGQIAgha95dyDxoVdN0yXnCK8G
         72Wewm+WQ4u8Mam4v5LA9NB3hCfrLAOZYC4/A/CyHgrfM2NjcvS+915Tz1KroOqOOeLN
         4QPVdxGlVOez2bYespQldbdoLlu2BXMp+vPvOPPIOhivG8m5UQtjziOxoVe24zUKw1vG
         2nMmXeebgGDLUE94Bm/yNCRcSvuVZya0gJQWWsze3PSuFi/cUbOqw+lkhu+hGI050mwW
         bP5Q==
X-Forwarded-Encrypted: i=1; AL+hErGBlBNUCplEhSb3gzBWsQTJsxeCXO3HN20xfiTcY6zwy0V+Tx83ORx537W1jMVGOXd6NWWcMXLnixt3eg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8aUwzQc+V6e06yOhCjC+3ZWL7d1B+JQZxADD4dAYWJ5CekJgXt
	wcg+l9rRT5n3xaj6FsyC7vR2Ib/5eoEm4U1TzlP5mDLK72/0qwzYbzZ4
X-Gm-Gg: AYBFou19nKIiJDaJcB2KgUk3cgi807QUtDaWoFzRs2ZQz0EPQspX9RhwIkHhGC0Ob6W
	pdhl1a0BDpyXpaFVSCj7CUqXTnNmskYyCtSXGFLNOLAu058uYr0nnzGzFdgOWBMXJLhwNRUMjzH
	88/pO1kqnETXm/rcO31Zy7y1kwpSL6zy4GVYpUJCvI/ByI9R0BKWZpPv/EhtelDkc3Pl+VJC4i5
	v+AwthLcHjO6kWkM7019qp6iz45g7rfAl8uLPxPiEW8ydoAwODPVmsxNbslG7j+6n5zce55Ek7P
	LielyMAyEccQtvBOcHgpBjvMfBdpNq0Rfmc8uc1ifdEHoAd820beePMPXupk35hM5TcVCeGLmUR
	gJvaVa6H/42C5atYeG1VVd2JXFt7JQqb9bemjXpgFL4BMXZVrOOuOOe4+Wd1fDgkDuc/KtputIi
	cdwM8CZRn2Hk1pSYTM7CAhBMPd/XTB2yoUHmtBFeGrdyUqKzCVBTKWmpNomRRoK+E/r5W/bl3Z2
	aBChEGdUR7X+CGR0BCyqLZLskl2drQP4+y7/XUPfu4M63mLk9T96qLXJw8o6F5vG49LZw7ziHLW
	T/nt07PCaBK035c9TqaHKmQEX4xK8YEc/VuzHP5ZER3VFgc=
X-Received: by 2002:a05:6000:40db:b0:48c:6fa4:fc89 with SMTP id ffacd0b85a97d-49c71e3e248mr19746405f8f.12.1794765266275;
        Sun, 15 Nov 2026 09:54:26 -0800 (PST)
Received: from firas-surface.home ([2a06:c701:9f9f:6800:4b81:a189:67c3:a27d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223b21sm19488794f8f.2.2026.11.15.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:54:25 -0800 (PST)
From: Firas Sharary <firassharary3@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: hansg@kernel.org,
	libcamera-devel@lists.libcamera.org
Subject: media: ipu6: packed raw capture never completes a frame on Tiger Lake (Surface Pro 7+)
Date: Sun, 15 Nov 2026 19:54:22 +0200
Message-ID: <20261115175422.8662-1-firassharary3@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On a Microsoft Surface Pro 7+ the IPU6 ISYS capture nodes stream fine in
the unpacked 10-bit formats but never deliver a buffer in the CSI-2
packed ones. libcamera 0.8.0 prefers the packed format when both are
offered, so with it none of the cameras gives a picture on this machine.

Hardware and software:

- IPU6 Tiger Lake, 8086:9a19 ("IPU6-v0[9a19] hardware version 1")
- sensors: ov5693 (INT33BE, 2 lanes), ov8865 (INT347A, 4 lanes),
  ov7251 (INT347E, 1 lane)
- kernel: linux-surface 7.3.4, that is v7.3.4 plus the linux-surface
  patches. On top of that I run the ov5693 clock-lane gate series from
  v7.4-rc1, int3472 patches for the ov8865 POWER1 rail and the INT347E
  "vdda" supply, and the ov7251 v3 series from the list. intel-ipu6 and intel-ipu6-isys are built from
  the unmodified v7.3.4 sources.
- firmware: intel/ipu/ipu6_fw.bin from linux-firmware (471040 bytes,
  Debian firmware-intel-misc 20250410-2)

What I see, capturing with v4l2-ctl straight from the ISYS node:

  sensor  size        BG10 / Y10 (unpacked)   pBAA / Y10P (packed)
  ov5693  2592x1944   20 of 20 frames         no buffer is ever returned
  ov5693  1296x972    20 of 20 frames         no buffer is ever returned
  ov8865  3264x2448   20 of 20 frames         no buffer is ever returned
  ov8865  1632x1224   20 of 20 frames         no buffer is ever returned
  ov7251  640x480     20 of 20 frames         no buffer is ever returned

In the packed case VIDIOC_STREAMON succeeds and the first VIDIOC_DQBUF
blocks until the capture is interrupted. The kernel log shows the same
short burst at stream start that the unpacked runs sometimes show, and
nothing after it:

  intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-4 error: Transfer FIFO overflow
  intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-4 error: Inter-frame short packet discarded
  intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-4 error: Inter-frame long packet discarded

After stopping the hung capture, unpacked capture works again without a
reboot.

To reproduce (front camera; the others behave the same):

  media-ctl -d /dev/media0 -l '"Intel IPU6 CSI2 4":1 -> "Intel IPU6 ISYS Capture 32":0 [1]'
  media-ctl -d /dev/media0 -V '"ov5693 2-0036":0 [fmt:SBGGR10_1X10/2592x1944]'
  media-ctl -d /dev/media0 -V '"Intel IPU6 CSI2 4":0 [fmt:SBGGR10_1X10/2592x1944]'
  media-ctl -d /dev/media0 -V '"Intel IPU6 CSI2 4":1 [fmt:SBGGR10_1X10/2592x1944]'

  # works
  v4l2-ctl -d /dev/video32 --set-fmt-video=width=2592,height=1944,pixelformat=BG10 \
           --stream-mmap=4 --stream-count=20 --stream-to=/tmp/bg10.raw
  # hangs
  v4l2-ctl -d /dev/video32 --set-fmt-video=width=2592,height=1944,pixelformat=pBAA \
           --stream-mmap=4 --stream-count=20 --stream-to=/tmp/pbaa.raw

For libcamera: since the simple pipeline handler started preferring the
packed Bayer format, libcamera 0.8.0 on this machine only gets failed
buffers (bytesused 0) and no image. Making it pick the unpacked format
again gives a normal picture from all cameras. I mention it here because
the comment in simple.cpp says the preference also works around
corrupted frames on other IPU6 machines, so it probably cannot simply be
turned around.

I have not found the cause in the driver. I am happy to test patches or
collect more information from this machine.

Thanks,
Firas
