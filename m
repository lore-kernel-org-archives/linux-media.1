Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794088190;
	b=TnJv/1Nh7walVjVNyQ3ezpsMd8QuiTgOeN2aONuORQwSfdTYmkXYzG6EhC4B/GIe8Im8
	 4/ls7mvkxEyjpB/8mlM03woELACLxBQoWhLPwwPrSFaoRkWWrjihvr5d/TWEaRuWgZsi3
	 WsqYA0SZ9IWm1u4xGmwS91u49crpjS3vAFFSLY1YbgNVyIIGZBjNNWsPaR1X8EQulo2Qf
	 GNFfhN6b7IPNahY3x0QZPNYvl/lxQ495B4IeRjozqKr0cPDJxp7aBEix9vvXdhXErL2x+
	 Gwum9rlXdaDNEmAmHiDB1Ip/lIrzuyO0EzgDtfbwB/LgILp8Mc/bENhCTmX3lHqgFDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794088190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7CcbexiGTPXAWIvnrM/nJrvHhyzwph2eaGwbgRfapUY=;
	b=KLK8oXzf088c5pdT0hrhq7CMIxXyAcVAZJTGo3uvuheAgX7NNBL9U7EMYfbRoleRbtTk
	 K5DsSv+UQEkigT+8680/+ljzzHk645HODo68TRboAEKg3rMr7q/0l0S6lr/lyZsUhTFxm
	 ebS/rAWvZYHtO6blvRfbwcxdYc+CBY9L9qF9qHp0jXtO2rDqH6b9RHU4b+ZZilD9I+M0C
	 1FQTV5gmr9e6HK7qDHjxLlvpY8naZueuFUt4ma6jV3ftWfHdv+SH52sWOXeCyD5I+aSwV
	 lilzj8yMWvBjEgv/T/h2vJfk2uvIxwiR0kYw6ogIJxKvnRP+W/4xerlVQ/m2bMwWUuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFfvFE5o;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AE7606A326
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 21:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52AE7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFfvFE5o
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso445954f8f.1
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 13:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794088189; x=1794692989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CcbexiGTPXAWIvnrM/nJrvHhyzwph2eaGwbgRfapUY=;
        b=dFfvFE5oX5R9QGCQ9h4uy9o52M4fQKjo0s3Z663o4wVqWnnvvD65je6S+5i8DFUJIh
         qxMqxiCS8Lm/O6L412ePaBtMG+ozsUSpEQaoItdaEDsyV8la2KiWDK/92WLZyAsylm3L
         Tcd8xz7psdNw6YLfE3gE3/gAezJoH3uRSbjjxzXDghaJv2/dXjSW9Hfrj1X+z+aiibXy
         lTF4OzTkHcMUQUyPY1/tTUi0ksdZCpkvrJHizodhXR/f02hwQHEBSsZKwoB6KavGmLIg
         OeiNmF0ifWj5q0HbOxVkeBKSvT788iMqGhjHGQyY7HL68/vMOuXMxaPHOYZhNlX7EcAu
         Xhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794088189; x=1794692989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7CcbexiGTPXAWIvnrM/nJrvHhyzwph2eaGwbgRfapUY=;
        b=NMm69j5ca5Cd6TSoOj4ypCX1YB0WHQvtE9L07khuTemj2j8XDPxyJ3t3cmJGwRXKRR
         tXx5GQMT0BD8ebyA0zjvFVHYdiGjQ+E+HFj4xW0YfNpH8vgAoHGJulGuZ22cTWLEAH17
         gkeXcyaEfx2aC6IV1c70Skn29sUqssYFmX9IIjuG3GNmgKZy0sZcLPXwB5x3JJGsnU1i
         2Rljpk06iVpnbLN4CAMQDUR8RR/JmX6UEfE27s7QRHqHcxZllFbfQlGLBe/up8p/k0v1
         8LsNra8Y9I08pgBC2JsnF1QA4qmveNaZhHoPNbWSWjqIipCGIchGhQbjYx+3itG/mTDg
         MuSQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9OR2ZRYwOIGfyA9MOlXWp7JenuO8Hjx/R9VhC+f3gKfWbHnYPIsMGg5I7wSE0tOqEmHeyzn73sGF1DA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8U2SrJXMp7CtBETJFvxor4/2oybB9XHdUk02oG/8fwvYjyGtBq
	Qh1VlvU41SjvMj9mY3VUR7p/kf7IAi4slcOAaGi0SwADp3mfTLQ/kfNa
X-Gm-Gg: AYBFou2TJhbXjUI1dcAsAjPO2T26U+5V1NtYqVyEIrZzT3bnH0gFg7qkVvqPpmOsyxh
	UozRyHRxjCmbw0l9IjpF1DRvam2SCHR9Ysrldjc3WCbJJrg3sGeWKaf7Lw8zlKeKRcFEqU2yMSC
	+RkYTzwJSxaOrGB0Y8NR1bWg2t3Yni2HX72Zzws3Zzr6tgH+YQWgb3cy8zHbQGJQcKmV82E9B0M
	hnlATcdgomAkxml7ZJl8cp7sdAPGTspVLfVHDFOiPqV51FTcDBF8Rjv+Q1DsRZaAejTptzD8Bjq
	f2hgEs6T7mfGI5KGRILQnnShNvt4RydMAEIqZ2+kVEZXOIox9AauaqPCWsCAzKyTTFues5c4yBt
	Gim+G7DAJ1AcJEBK8D8/oUwzZq1Q1FO42lxd1flBhrnT3eOCtnKwFLLSPIe59Kt7pip12Vdj1hi
	J6ntsrd8IwX7upKs44Eo9In+I4ujbTLfXO37gkfMhGeMJ1nfOLFhtfjnXYxYl7pcTexwno91FNv
	lZhNKysvCuWouprLh7vg+FubVBPMWriUsXcOfipzgds8Uf1dpEnEuDuNBhQUbxahuXulyS9COS9
	9SRuFw6+y71qR4gCFujDhwneXBqk+PKhNFZDhAQoplyhG4gkR1sAc1laN9vvQNM=
X-Received: by 2002:a05:600c:8705:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4b94d75ecbbmr1722145e9.2.1794088188503;
        Sat, 07 Nov 2026 13:49:48 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cb76697sm64774315e9.0.2026.11.07.13.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 13:49:47 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Alain Cousinie <alain.cousinie@laposte.net>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Milan Zamazal <mzamazal@redhat.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Robert Mader <robert.mader@collabora.com>,
	libcamera-devel@lists.libcamera.org,
	linux-media@vger.kernel.org
Subject: Re: libcamera: pipeline: simple: Disable packed mono for VGA sensors on Intel IPU6/IPU7
Date: Sat,  7 Nov 2026 21:49:43 +0000
Message-ID: <20261107214944.181140-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <169ccc0e-d513-4ae4-9a46-cb11be7d1178@laposte.net>
References: <c218b8a2-9e69-4ef3-b36c-7df7e7637d4d@laposte.net> <3a98bb5e-a4c4-40b7-ad4d-1b251c03b4ff@oss.qualcomm.com> <20261101164311.GA3368923@killaraus.ideasonboard.com> <304e2a5a-f8d8-427d-84f5-b6f4498452df@laposte.net> <20261101195019.220940-1-fernandorimoli11@gmail.com> <6cfa9260-b48d-484e-9c88-b75feb0392f9@laposte.net> <20261105004652.147540-1-fernandorimoli11@gmail.com> <5bb49b41-368c-4889-9f56-9a477e85694f@laposte.net> <20261106163039.18237-1-fernandorimoli11@gmail.com> <169ccc0e-d513-4ae4-9a46-cb11be7d1178@laposte.net>
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

Hi Alain,

> Has a formal bug ticket already been opened for this regression with the Intel IPU6/ISYS team,
> or should I open one myself? If so, please let me know the preferred tracker.

Not that I know of. The mainline ipu6 driver has no tracker: bugs go
to linux-media, and Sakari maintains the driver. A new thread with a
"media: intel/ipu6:" subject, sent to Sakari's linux.intel.com address,
is easier to find than this libcamera one. Include the kernel version,
the IPU PCI id, the firmware file it loads and the log you posted.

Fernando
