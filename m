Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093547;
	b=xpQHYiFJsZ9Y7lU2clEH91kHaj9mnDpYlCKEw1js0rbgHlW7WfGQYfcHiNT4EQ7oKPUd
	 QotL1SYZxvWYU3rJnTuEc7w+HTLEpOky0oPLRM8oKIXhNagRu/apsyCHbtHCjFKhdDzgw
	 TqpQzAH11Lv/0ODYHuy9FotUUGYnTmImt7bpDee+jmItE07WPdXAqugcNL0wFAQQZj5/p
	 aE+g1zDzfCjBnXxMUsca3VPGAG0aKnx6hsvfLNRxztIA2QkRLfpv77upAkwNlEHWBxUuY
	 SGl1EGYf4wRvN7V0TgJuNXB5CSbWCcIk+Pp+p8nHzOUqbZ2WbpqA1utT4n6oOSZMmrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lonrPgzITxIfOIRaHBMV3jndVBT4kID24OJ8RZmSv+Y=;
	b=2zqfFlrOhWDYc4uQ26Cni1oiiEm0KdawJJ2TF/9Q4s9lHfu4armKhScUC3kOmr1TTWR6
	 nryN8NBsPa/pNzmYIxLa4Hp4a3XwRKdJCbIK3dhG2TADqdM30QhxQXtbURPxb2CJgjz3v
	 hxcZJATBKRY5khKgj8oU5sZYPwpCXEe8Eb2BzEHtCr/vOO7kSK6e2lAhNOI7lNgF0pRVU
	 JGKGk7vifdsHlPJYVRdcBXsHisGczP1atW4AQDbqFUmkJUJPDcujB+S9pTdjzzb4ZOaSw
	 WbvSQ8E44Kbv3c9cs9WuWtXz36zR6pWW0cmKpLCSr5NHYuuyQF94jghPMNEqP3u7ykA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EPsPJjB6;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55946606A31B
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55946606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EPsPJjB6
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a59ffacb51so2722095e9.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 02:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093546; x=1793698346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lonrPgzITxIfOIRaHBMV3jndVBT4kID24OJ8RZmSv+Y=;
        b=EPsPJjB6tk+9lS2vBLhPnc2r4+N+fNa98lu519tf+SuIp/3JsFoGyUhbrUFM8XdLa/
         lHmSk7MN6yg5IAz92PxXw9yBYOv9/RDDAtd6XEErmAqydqZfOBikYLtYJiWkGK6cMKRj
         2TTyqvn2Ny+3hrDVe5ThLcRtgdKHjO/msmduWrrWMc6tMZsuKZCrqLnlfpqHpIs7TasB
         oVTWSNiROo/y81QLjfhZnVYxrD2+2Q0BFDFIIUUnuuVMAyo9PzWm0diQB+qweIqk6Jk0
         UgxabAqUv2hUpdBEiDu9rVcALloYdaaPRpDYlYt4oKkS662pwf/Wj6AJ9jYpHJ1sJVTf
         Y+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093546; x=1793698346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lonrPgzITxIfOIRaHBMV3jndVBT4kID24OJ8RZmSv+Y=;
        b=QGohxYf/XJxhqoC0vnaA5LJxS59dGiYAnnapk9akB0JVSIWcXGoSa9InUnZDvMYcB5
         pFduqkv+3nQhLqPUTv9t+1IjGIiJ5++FwXXOYwiJagSbiI+YAG9nyWYMbbXrjvI5nxTF
         GiNVPhdZyvZO92lq7XxlPJ0osL0PcCXwFmSmtt9/U0gfr+gb79ZSPTi+TdEpJmra9cdN
         JEP2TwbJfDo6Ed7Mh69QU6PjHyMKwFjd/83SbaB4RJqXtld57A58n9NJJ4StyZf6AmTj
         IW6PF2EtZj+1pPQ136gKhmHM+spJG1hzKfBFZ2RVVEo5Ew/+0XGbZhkweyBLsTxmEjtM
         BPJg==
X-Forwarded-Encrypted: i=1; AKwUvBz0IcdulD4n/bVqfrCn0/RKqyy4dQ5FAPNZyjwuPWnf8vXE01L+VszaCvyWrZ4ysWHyunhpWMgztYxApA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJj7v2G26euzkAv9DYAQ8xdZ9jMxjEJVh+s3OQAxuAHbEncn6Of
	o8W18z91WSopT4XhLizhG2PGf6JsHoehtSubAYrtJvwtGdaKCVJNDZGB
X-Gm-Gg: AYBFou1wLtpxP6CU97hfQc0fopulrEEqs/gp1jrMrvZtJueOVqlTSuDmWNW9mcu3Uac
	1ovjLKb1cdNl6HWB39/bfegsbBQYcANpaXQ85OFzbEJxXAd5w0LOOKNn3TB9fyx/j4h1xOeRPFe
	z6U9WKiaqohxpRrdjLIlojHFFcDhA38Phz6lbNpWnixb5zbaYcs0QQti/j+RQC43VDh9TdVOrTS
	XutB7tzUaxHPM9YAauWLnJjglY/blzGmoo9ako1BEWsFFD4gTVU3Soaj9OGoPXwe8hEKprsOjkb
	rQuAWOiLmVutIksVQoeBEqROiiK/gWrpvuRJuxfBS3QduleEEhn40t67OpXZFklM7x8eK8ZQIu9
	p8MEdpFxhpCuDCHuPcvdwaiW0Z/BsCogUydlRdquQaCYt7zibWKmSrRRLNttv+tYbjx7XeG2LqM
	/wGWvSFTNRv9yaTqkLGSj1QVkxnx5qvSeUygN2Z7iK9yRfqwfR9IG7vBpBMpC9vMim/jDEbZphL
	UfYCxg3E2m+34ki/zGqcmAG8VDxvwVwNvrMqi8MS/3+Bv9Y2Tldm86uDF7a
X-Received: by 2002:a05:600c:6088:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4a35aae2effmr166021995e9.0.1793093545448;
        Tue, 27 Oct 2026 02:32:25 -0700 (PDT)
Received: from Termis-ROG-FLOW-Z13 ([2a09:bac5:521a:2e6e::4a0:b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a573f65sm251384855e9.10.2026.10.27.02.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:32:25 -0700 (PDT)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Caspar Adriani <caspar.adriani@proton.me>
Cc: Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	Bin Du <bin.du@amd.com>,
	King Li <King.Li@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	"Adam J . Sypniewski" <ajsyp@syptech.net>,
	amd-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: Re: [RFC] AMD ISP4: OV13B10 (OMNI13B1) rear camera on ASUS ROG Flow Z13 GZ302 - ISP comes up, SET_STREAM_CONFIG fails with error 6
Date: Tue, 27 Oct 2026 12:32:18 +0300
Message-ID: <20261027093218.35631-1-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <P9m7agZFwqTsT5eczqDOuUVoP-lGl6Nd8FLvknyAj7gm7R_4cwIpb2_3-DNis287elaS_x5ummKLdOf_rk7LcHZqnrTnjMuzEPcX2syIefg=@proton.me>
References: <lWYl1YJwDSh-q2Ew2f8b0BweQ4V-SUnPMSMurU5gT1LkqVdrmWFunj0sSgjC7m66bORBAD_jRCFTt1_ZOkotOMukY46rI4ayYbIfPQq4E9U=@proton.me> <ea758386-13b0-4667-8eca-9aa4efefe92b@amd.com> <P9m7agZFwqTsT5eczqDOuUVoP-lGl6Nd8FLvknyAj7gm7R_4cwIpb2_3-DNis287elaS_x5ummKLdOf_rk7LcHZqnrTnjMuzEPcX2syIefg=@proton.me>
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

Hi Caspar, Pratap, all,

I have the same laptop (GZ302EA) and have been working on the rear
camera as well. Some results that may help this thread:

The rear camera streams on my machine (NV12 1920x1080, about 30 fps)
with an out-of-tree setup. As Pratap explained, the stock
linux-firmware image does not start this sensor; on my machine the
camera runs with ISP firmware and sensor setup data from my own
Windows driver installation, read from the Windows partition of that
machine. I do not redistribute any of it. The firmware alone was not
enough: getting a picture also took the board configuration and GPIO
wiring below, changes in the isp4 capture driver and in the sensor
setup, and the two fixes I sent to linux-media (link below).

Board details as seen from Linux on the GZ302:
- The sensor is \_SB.CAMB (_HID "OMNI13B1") in an SSDT, without _CRS,
  so ACPI describes no GPIO, clock or regulator for it.
- I2C on the ISP's bus: the sensor answers at 0x10 once it is powered
  and clocked; the focus motor is at 0x0c and the module EEPROM at
  0x50, matching Caspar's scan. My guess is that with the stock
  firmware the sensor never gets powered, because SET_STREAM_CONFIG
  fails before that, which would explain why 0x10 did not ACK.
- Sensor reset: amdisp-pinctrl GPIO 0, active low (the "reset" GPIO of
  the ov13b10 driver), the same ISP GPIO as the OV05C10 enable line.
- enable_isp (AMDI0030:00 pin 85, as for OMNI5C10): not confirmed on
  this board. No ACPI device claims the pin, and the ISP also boots
  with it left undriven.
- Sensor clock: 24 MHz, as declared for the OV05C10 platform on the
  same ISP; four CSI-2 lanes.

On the hang Caspar saw when stopping the stream, possibly related: when
a stream is running across s2idle (start a stream, then "rtcwake -m
mem -s 20"), no further frame arrives after resume, and stopping the
stream logs "fail to disable stream" and "fail to stop stream" because
the commands time out. On my machine the timeouts return and the
device can be closed; the driver has no system-sleep callbacks.
Caspar, did your hang happen after a suspend, or also without one, and
did you see those two messages?

I sent two small isp4 fixes found on this machine to linux-media:
https://lore.kernel.org/all/20261026182442.229869-1-saif.elden.hatim@gmail.com/
After the merge window I plan to post the board data above as an RFC
(amdgpu OMNI13B1 entry and GPIO lookups, amd_isp4 board configuration),
explicitly not for merging until the firmware supports the sensor.

Pratap, you mentioned contacting testers once there is OV13B10
firmware or a sensor-agnostic draft: I would be glad to test both on
the GZ302 and can share logs, ACPI tables and v4l2-compliance output.
My out-of-tree code (capture-driver changes, the board configuration
and the test scripts) is in a repository I can share on request.

One question for the sensor-agnostic driver: will a board like this
one describe its sensor through amdgpu and amd_isp4 tables as today,
or will the firmware take the sensor setup from another source?

Thanks,
Seifelden
