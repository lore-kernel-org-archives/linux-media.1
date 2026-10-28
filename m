Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187104;
	b=nkhbxgePgHW3fTE9bJKdi9dUE9fKI2/FdcjIsptU9i+FbyHlWFo4UEUUohdGFCUiCxTp
	 d944McR2GYzq1na6QN5uh2nQksqO84/SbQvliz9zXaZP9GnxEHBXxjIOK8lF2SNHxNCED
	 izD3aJJBYNy8QM0TsaSbHZfGY5nquuRJrxjGCRQ5Ah1ODxMunyTLImf2bjqWCpVW4aHYq
	 wnZr1dEEJTQ7rYEGzf6UiQb8oDYE/UKjZmaTaYCe6jhbWpZzzg40+OIyzdb2ozNAJr/8j
	 NAimazisaD88IjRAOBg4l81Juu3mX27gKUm2XD3VTOQS1o2abE/ZybWlPBXMYMXMgiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e0w3/7eOAnrV3ingLK0gM3yAmxvAMwUud/Elq71vzUo=;
	b=B+z5QYwWgBp1UO8FKSQHPbMDOGoHcJ66v2ekc3LDvXOJab9QcylLnD3Ck+cR2EVL4Ky8
	 ulqPH7lbWabD4+QPoEborAZy2BTxB1wfQviSs4xCfKzsmnTn3P68p5U7Y2N5FBFWd8yny
	 S/ZPFYziKYzUpIdG5yqEyat4MKXOLXCJ2n3/h9tugcIbwKiEIWytHy3LZ0CY97vlNlat5
	 IbPa2osOi2TpC41eK0m44faRGGGiihPg5g2b6MQRiCLpJ5n/v7+M5fUYgzv+bk8ie3bVi
	 dYob01CYbBd3DSCnxLk468b1E1n4Jy2stFblH1UfYjg1W86+a3KIRwB6XRH24kfK9ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bNUPTu7U;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2243606A31D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 11:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2243606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bNUPTu7U
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso8813575e9.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 04:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793187102; x=1793791902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e0w3/7eOAnrV3ingLK0gM3yAmxvAMwUud/Elq71vzUo=;
        b=bNUPTu7UGuNl9pImSlXTUoZnmq0Y0UH4j7dN3HWf2cVAyuEDrOmXho+YJPU/3YYj9D
         DWsEJw9Loqx0JiCK9k+hyCX2x/P4hb5pEqylKu8Bb1fIjJVCZBlZjO3HVybxbCezTDnf
         JPB64eomSETBOBTntHIXlpQ1imL4VGAm7t9kULSHHoZMWu1J8ZVmnzKWSuq/KECG7lZW
         y/nhOWeDKEFRh69aeVctxixRCXzQQFyHRFHIm32uQwKmLLUgTOg7hmc2AqHOvJ5gdZPF
         IwGUbJqENl2mJ+CGQTg154VvdexkyFaYb/ZWmZoucTNOs9kXUCEnjKEeVDaKirW/dNqK
         TFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187102; x=1793791902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e0w3/7eOAnrV3ingLK0gM3yAmxvAMwUud/Elq71vzUo=;
        b=l79VCeMbf5arNNvdYE+dRBtUEs+OdnTKk/Ya8ci4/oRWRWJVSLLr8LZ9Hvp2BN2WSV
         pCTZulVHaxJwKX5aNFsYkxcsGgn5soUhNvkaL3vikGLgTWdrGu1ajtxuo53xb5IdFkkD
         RQGqOoxZQFpO1BOvaTrNetdhFj9wOmBZpqcl2KfIgu92NkcwHzOJMrheUXPLWWYpJI9c
         jYrwRZWduOZTTOSgnHgm1hWf6/U24SQwRDUYdTWn/tbfFTb1DU7gbI5CPTIcN7ngP6DH
         bs6zQ0ytyBYl9Kyu7OCtw+feoo+B/2ApB8wJl+m1a3h2ATady83GHJ35/uhYRtBIv4PL
         JtMQ==
X-Forwarded-Encrypted: i=1; AKwUvByWI1t/2pL/O+eVnacPaWIvZIhNF/BIa16dESHFnTmtja6LE6roNE0S053hZuD+Q5I9Kc1GnV2JkQvsLw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4rQ37CQQ2E1uQ9A4V2MepTUPMjDGZSYMVkAN1ef6eg21mjjEQ
	TZtpZ0GeL5/lWTek4DLJ2Sy5KRoEEbkL7GEIV4Na4K6IYX+Snya6xjS6
X-Gm-Gg: AYBFou3jVByCSjHHuANHIkekNQ2kDqfeIItwVcMu5eLs+uj1bFicxEYOyrmXdSUoTML
	WzhpEzFHkYJ0wq1BHNJ6a12KcWrilyk3k2HWuWvlGTdTY6f9x//ZjZ0SU9sCM3siXmmAlIPCrw0
	bjMsvrcGFstY55lpNkLaW1ce+UQcGMxzkHT2saNJoEoaithdi1JzPCLsrVbAzDs40v8OCVd3mOE
	Y17cSFJIhBn/Ja2qvwLMcH+zaWCGQNptujxoNlNTeUOPyMy8elQhduMjlGEoSPUBW6gGyx3+d+D
	Mvin+rq4931U8nn5gTOanWoeEPAzdrRVHMmfroqUTXO2rHuy9liyCa+VJTLBzUnuyvGpKd1/qdD
	OPdy50wvXh0liY7FULmVcbbMQkOkEs0miLD12BlgBfh8r/KJqK+yQjlUosaH7ZsEZaGDiJEWsTT
	JfGiHFj+fuQxC1o4qJputx0OfZCe7zyDfwNX8fABvivBhmtMjGjKyYPnaJZwp6QHXWdnUzX/Y0v
	EPP4Q3EPU5c1Iupj1mPGQSpBR9N4iraxZ1ZhUGJs756cvkUWoAgaTvo0NqCt/xSeE3/WM1CD7CV
	PNYyjqtTarigs5DIm1/vQ807/dQfEJ7ENnbV3LYL2f2e0sO0nOcQS0F4xOopP2O02Jsn59lqdyf
	HvXgNEzhpq+W41XgldSspG+vJsHi7BZbRoNH9uwNYbwLYqoMhUC1P6ImH1zeK2bfDmA==
X-Received: by 2002:a05:600c:c117:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4a9672f814emr31095005e9.23.1793187102007;
        Wed, 28 Oct 2026 04:31:42 -0700 (PDT)
Received: from PC-Marco.lan ([151.59.117.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97a093e86sm38764415e9.1.2026.10.28.04.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:31:41 -0700 (PDT)
From: Marco Ziliani <rylos78@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	libcamera-devel@lists.libcamera.org,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Harvey Yang <chenghaoyang@chromium.org>,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [RFC PATCH 0/2] libcamera: Power down the lens while the camera is idle
Date: Wed, 28 Oct 2026 12:31:39 +0100
Message-ID: <20261028113139.36605-1-rylos78@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028102323.GB2587630@killaraus.ideasonboard.com>
References: <20261028102323.GB2587630@killaraus.ideasonboard.com>
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

Hi Laurent,

On Wed, Oct 28, 2026 at 12:23:23PM +0200, Laurent Pinchart wrote:
> I want this discussion to involve the kernel side.

Agreed, adding linux-media and Sakari.

For the kernel side, the problem in short: lens (VCM) drivers such as
dw9714, dw9719 and ak7375 power the lens up on subdev open() and down
on close(). On ACPI platforms ipu-bridge also adds a DL_FLAG_PM_RUNTIME
device link from the VCM to its sensor, which Hans confirmed earlier in
this thread is needed because of shared power rails and I2C gating.
libcamera opens the lens subdev when it enumerates the cameras and
keeps it open, and the WirePlumber camera monitor keeps the
CameraManager alive for the whole session. On IPU3 and IPU6 Surface
devices the rear sensor therefore stays powered for as long as a user
is logged in.

The options I can see:

1. userspace opens the lens subdev only while the camera runs (this
   RFC, and Harvey's patch [1]), which works with current kernels;
2. the kernel powers the VCM together with its sensor's stream (Hans'
   series [2], or calling .enable_streams() on the VCM as Jacopo
   suggested), with VCM drivers no longer powering up on open().

They are not exclusive: 1 fixes current kernels and stays correct once
2 is in place.

I can test either on a Surface Pro 5 (IPU3, ov8865 + dw9719).

[1] https://patchwork.libcamera.org/patch/21649/
[2] https://lore.kernel.org/linux-media/20240901211834.145186-1-hdegoede@redhat.com/

Regards,
Marco
