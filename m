Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795552902;
	b=gF0du9zegOEhKZJNeetcRPFt3YDSBxiaWHZF2NC8/4n2goYerVRpuFppGaS3RET5juco
	 ko3cSmfzPvHPbmEN9tVy30dZpavMbh1yf0iVkB9LhHQJAeuf+Lsuxl+JR1iGOoXMZgqzs
	 327ZoVHia7nniNMYImfRtuWpj6QyzgbOZeT4DLvlbw8QEJN7KWfdRUcuv9/OjrbT6qoif
	 Q1PcCF1zW35lW75zPl0vez2RQt+7ZZVq8LYDpyKyisq9EwIS18bwUbiSu2lWtMV9HR3yz
	 wwMXkt/zcgnwdyOsEVT72C6YLECs6hNdU1uNqK5aBwb3mrKA/937/Mwqo3MUqK2e8Ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=cfQkHe8ct5z8k9K/wdTyaveFi/2r5qvAZtFfcD41pyw=;
	b=JVwmQBxmK91bQlYDeb3sV5UVE6zCelSodHoAhZmMoJAh/JVa+rd66ngMQneIoc8vSiht
	 cGH1ExFBkXxhk7NvCIjw0hZSZwmi5CDNFncL87lKZBk6kYtX9yuPbx+SIEGpz+uIZyaNu
	 1f0KISmVE3KCp44rjd8OdYNXUNKcN+bRdT4Cgz5G0c1g0btDARI8akVXPWcROke/tZMPE
	 u9XKminefED33XcU78DL0nQceyEmdxNrwdi5IcmN1CgQjoPcKVyElsH8B2EXiGnSsMYHF
	 fMzwkN3Rtfne79gm16SICWRhy+ixko4r+kfGBC4hLV3ZNhNqcrDkLYqPJMhjxQZnr1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u5Pagd8S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB989606A330
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 20:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB989606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u5Pagd8S
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c516a1623d0so452862566b.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795552900; cv=none;
        d=google.com; s=arc-20260327;
        b=XvWpa5IYOZAqCW8tAGye1Td1d2Qj1RPSpXhhL/cthd9syKED8q2N1oxKi9XxZmTNMV
         8mo2Bi1M7Qy526mkBI42jVGRjBrU8CUxV8W0NEXD7NFKBF384tTowDPJbdtjIvfGZL/t
         GkwhvoYTpd0q3ZKPCmOxXGVYMlDaJLTMGAItMIoLWpqeMm9Ij+wgCt1aEzC2eZ1BViN/
         u2ILRcffE5OW0/P3QJlQ/iU9KAFIsvP/9E+oA8qTTj4nJbtbHchYAMCZIVfgSpBg5LZs
         8S7soBTyqxJW7ErlGkCyg/yCq3B0SXUu4NO+JcD/9Bfn4Yl/qg3SMByVqOrw3swNAglf
         e1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=cfQkHe8ct5z8k9K/wdTyaveFi/2r5qvAZtFfcD41pyw=;
        fh=VAn+cTnJ4gvejE9TAe7Sps2LkCz2Wrw/dqyjat2IDMM=;
        b=US4i9iGrw7pies2PcqbwmBwsHPUyj4Eujrq4ySxOeCizNKwuqApi30XPoPjYAEAkBf
         rVqNUw4YgaaQWcKVJ7AUI6pejEq84zJ30cvZDjYKN9M0bQLo1i9Tk5fGrS+jLT0gxZEa
         I+Bs5cyY9nHqt4BwUhuc4PpPuuUnHhDTgbOcyqqcpSVNqyfIq2wYWS9nETdQtbhBB8aI
         XA8FW1EG9fW5M0txklaYEIO2ExpXdkeURcOGoe8cNWOM6WDCjPmd22V1+Bw24UP89lkE
         OjtMs1EFWYoagYjLKZtvFzR/gn28CB1vm7aAZLEXlcIsycsejPh/pTaLg/oL97PJJoIR
         WX6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795552900; x=1796157700; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cfQkHe8ct5z8k9K/wdTyaveFi/2r5qvAZtFfcD41pyw=;
        b=u5Pagd8SupwMgMxX/XhA7DbwbiqNwM4D/PL5rFs/LvW0GBWBFVJzAWwWU2TdC8k8+k
         AC0cCx+YXDGfgPGIuE5dKnc67iw3dgaVwj1APo1QzLrmFZ8qqZUFy20h+abw0C0RxXZT
         ojcKj0mZxslGDL+1d4ZhVxV1dpTGIKB3epYynBJjp+4ixyjiDWO9BsQMGenHMm0oUgUj
         jzdxlyHsRzXOkOLFTJk44Jb6iW/V21VOhWMpVACodwBiOkdkPn+0R9kUmrbouMjJE5zW
         z3+2mntt3jnYIyUrCBdVrZGsRCch/HPaICqjh+FnMpmWHO30yVFq8rNeaigaXRwLMn8k
         Fklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795552900; x=1796157700;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cfQkHe8ct5z8k9K/wdTyaveFi/2r5qvAZtFfcD41pyw=;
        b=odZeHEcdRBk2v22yNnsHQdx+K2o6Tuly4xByDPpySt5OHCf1hliEfmnEvbETqXesIL
         58upRKfTNMJl7qK3pgIj6CwCffejLoFMUm+vYTmjx9Qrht7YzvDjowKO4rrpu9sA17C9
         aEAEXF12nligwRQmInWUBnvL38hlbHsvy9+fxQK2daAcNfriM9AQb4dox7ty2Ux3adI5
         cojoIFLKmfkCxIHRuMHJDYAfRtnSH4XOTNrdGc7SN2K+Jx2GMwpmWlwu2VAgR5P+mG70
         XiNxcV7iHS+CSYUKN6Kl2+OSxNgXIZe/aqC8Mkp5pS2X6YUv/zEsn3Z/8CzJkmjGIPIL
         EghA==
X-Gm-Message-State: APuU4Z8XBkdyC6cJeNlBehAwALwxR9yALfutt7zvIOm8KwEhIVFywvHq
	PWepHTdgHH6TpAt84NWDaUIaajzPiloa/eMaKrIPObSIMj5S8+nLGmzxdOa4iSpIz/EOg4gQi94
	sk9xlO8Q9pPAw+aKT1NXLt8+ltGM190Q11gRm
X-Gm-Gg: AZFdTZdXDPzI7JoIexxuALYao4MLhBXfI8rcYsc3JbGzV60k8a0Pj2IZclyCq7+RvNf
	nPBY75yKiK7THWoUHl5KuzB8OYUTWY9upQ4uSG+ZpxAaEGjKWKXCCP4gOk6CPrIwm31dd6j4LMM
	kXUpeH9EvtkBxUSy6qsMvfS0IKRPmtFi+cy9dJeZqvbsyuVpAuA+PbjQ2V9wccf5DrVQ+5vYmB4
	2HexG7rmLygMm/ZHDzLdmfRra0+3I0TS+xg0z+f7v5KRTxpx4ESkJUpujVlJTmxkXkqIinBNiEu
	YozHxeYj3IIorreij3OSXuuPC72lqvt6TtIwBaTNFI89WIuYaQ9hDupbLYcy+v94u8sKiuUpDsn
	G9cCXr9Y+QdEOTJK1hmWHkZpKP0V44BOgd2QUqN/eFYQyJbmAKAp1F7/CFskH9hcxy4Jo
X-Received: by 2002:a17:906:2419:b0:c50:750a:6a1b with SMTP id
 a640c23a62f3a-c513a878473mr1050695866b.29.1795552900114; Tue, 24 Nov 2026
 12:41:40 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Tobias Wies <tobiaswies@gmail.com>
Date: Tue, 24 Nov 2026 21:41:40 +0100
X-Gm-Features: Aa3M54pGN3vUqX5byE60P-ZQfoxr8KphivqtiaL5bKlNwllNwEvkSzWWu68Cr-s
Message-ID: <CAN8C2X1A=dhCX-f=TBR47D-AgUBh3Q1HtE6_DCJPwDnR2GW3LA@mail.gmail.com>
Subject: [BUG] media: ipu-bridge: HIMX1092 entry prevents IPU6 RGB camera from
 working when no HM1092 driver binds (Dell Precision 5680)
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Since ipu-bridge gained an entry for the Himax HM1092 IR sensor
("media: ipu-bridge: Add Himax HM1092 IR sensor", 4fdb0342f05e),
the RGB camera on my Dell Precision 5680 no longer works. The IPU6
async notifier now waits for the HM1092, but no driver ever binds
to it, so the notifier never completes and the sub-device node for
the RGB sensor (ov02c10) is never created.

Hardware / software:
- Dell Precision 5680, Intel Core i7-13700H (Raptor Lake), IPU6EP
- RGB sensor: ov02c10 (OVTI02C1), behind the IVSC
- IR sensor:  HM1092 (HIMX1092), used for face authentication
- Kernel: 7.3.4 (Fedora 7.3.4-300.fc45), CONFIG_VIDEO_HM1092 not set
- libcamera 0.7.2

What happens:

ipu-bridge registers both sensors:

  intel-ipu6 0000:00:05.0: Found supported sensor HIMX1092:00
  intel-ipu6 0000:00:05.0: Found supported sensor OVTI02C1:00
  intel-ipu6 0000:00:05.0: Connected 2 cameras

The ov02c10 driver probes and binds, and the media graph contains
the full ov02c10 -> Intel IVSC CSI -> Intel IPU6 CSI2 2 chain, but
the ov02c10 entity has no device node. Nothing binds to the HM1092
I2C device (/sys/bus/i2c/devices/i2c-HIMX1092:00 has no driver), and
the ipu6 notifier stays pending on it:

  # cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
  ov02c10 20-0036:
  Intel IVSC CSI:
  ipu6:
   [fwnode] dev=nil, node=HIMX1092-1/port@0/endpoint@0

As a result, libcamera cannot open the sensor:

  ERROR V4L2 v4l2_device.cpp:92 'ov02c10 20-0036': Failed to open
        V4L2 device '': No such file or directory
  ERROR SimplePipeline simple.cpp:1930 No valid pipeline for sensor
        'ov02c10 20-0036', skipping

Confirmation:

Rebuilding ipu-bridge for the same kernel with only the HIMX1092
entry removed fixes it: the pending list is empty, the ov02c10 gets
/dev/v4l-subdev5, and libcamera streams from it at 30 fps.

Expected behaviour:

A sensor without a bound driver, especially a secondary IR sensor,
should not keep the RGB camera on the same IPU from working. As far
as I can tell, the HM1092 sensor driver is not in mainline yet, so
every IPU6/IPU7 laptop that has this IR sensor in ACPI likely loses
its RGB camera with current kernels.

Possible fixes I can think of (you will know better):
- Only add the HIMX1092 ipu-bridge entry once the HM1092 driver is
  merged, or revert it until then.
- More generally, avoid letting the notifier wait forever for a
  sensor endpoint that no driver will ever bind.

I'm happy to test patches on this machine and can provide full
dmesg, media-ctl -p output or ACPI tables if useful.

Thanks,
Tobias
