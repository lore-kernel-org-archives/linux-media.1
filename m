Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A9B4AA004
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 08:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051440; cv=none; b=TwsVW033fDKU6A7nWaScDw5SLYGMyUFu4e6GrBK/s8bGT5SvzNWegnnpX5/2H/MI0W05AaNB+SLuesU3LEPeMKTGkzupfb3eCEHqTSM4tNVk2z+BEK/ZnCcBQLk9Qsam8aVn7cNFWyG8SWaUANLcKhs9wBfSzHl3sM/1TlkSp98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051440; c=relaxed/simple;
	bh=eAy8FyqAj/6u/iCL3bNVJzpfIFCsui4VN0FIBaEEVyg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1JQtGheG1OyHDgIpUt01zA+GYBPMQY9G/NHbnSplw9dcOv9KlYUsIvnN0fA+IBs8tmfFm+2hyHOrvfN5BGSGuMmV+KjSfJQOk+mWNfLn1QWcqs3gydBYhmInZuJPDspIZ7zkd4o0cSrPSoO5mpGB0LGcejhAmbklQ49xzOkH74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0e1L6Ge; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0e1L6Ge"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so589034f8f.0
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 01:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792051436; x=1792656236; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w3PoSub3HN3t781ukJWOyc8aubtbPwNb3v0kAijShNk=;
        b=F0e1L6GegAXKiBsRndfGiLZ1GpeI88yUZzhkRfAKsai2PMkUIbaLTtQpQOhCFzbDFv
         L6VqNiBFA305JJKdOR5lQmBW9bgGsUJrCF5G69xJFqoyqzGBZrHsYHRJmCTyeegtI7Y6
         nhv3or/kgFiW6XRbzrnGexafe8eGcTycnRiNgGYw26kM+tjHXsENq5vJDaoCeYohBaFp
         hkOez++kIjMdNenejdrNtxSsU8T0CccA89lwZ3s0JsqEonZsoTE7/GD8SqQxeKeZ3jan
         GANGu4PSH6tQlUhAJLQGpQVSU4NazkFBo9w+4G80XwFSz8S4z3NmXr5ZZOZPgaGON3x4
         fFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051436; x=1792656236;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w3PoSub3HN3t781ukJWOyc8aubtbPwNb3v0kAijShNk=;
        b=h8hc3wffXUs2hub97tNFzFY3oyqN6OdIKYw3GF1QnCDHk1ZmXwD58FOlxm1ZV9Yomt
         XOk/0IRLUufJTMHBlymjGgUKkS0s3HhDNFF3FwwBWrHoTCiddzusX9ywfIW9j9LHt8hZ
         OT6sgDwRt4rxWTbUL3JCZIe28Fu4AnkuztL91BCiXQ7MB4sANZ/Afee79UA6hD7/uOy/
         Cl7FbVCrw2zR/MPg9oOVs3AWfUHYPe2rDVwdsNuZ/tRGU5WDID6Tl9rcxjam3CNwO2Xo
         gFOo6X/nznG/HECtPflVJAtOkdZtEGRuSdg5gf21Yttde5T7q2P7udJ2Gih8SNfFJaqE
         hUBQ==
X-Gm-Message-State: AFq9FYIXDAQejDRxCQ92YNoaqUz3BCbNHNT1o7zTurwix5ExGfi+DfBI
	Ut56fqrwQpWz6jXdlFLXS1LlcE9XSXBPyM7/fUuMBl/WaHlhpKIuvlo1rMnmaASdLPQC6Q==
X-Gm-Gg: AYBFou3d6Gb3D4LerFwHRtxJXJTS8v+m5JFhNpy/v3NGRG+m/SYDh+UVNI///H05yLd
	hTJ/isWq2PS26bI03RE7ho9pNCyo1P/Ru95VXjPNWwbMxWDPO6RYTwD6KZvTCuxAZ8Bg2iGsl+c
	sI2TChNsiNNYwBFlmYrjRhIjHKyogZIMPuwp9z0i/sd7q/XPpbTXThpC1JeQ1Aa+GprW2LIGmJh
	W94UEV4xA7ZkZvr8XDCLmsc+gWoC5vm8KuYa8nWaq3OmZ12GQj924nRQE85swmcrzGG55/hf6WJ
	OWt7T3Oau8ppx0jf9dH31GubcUvk9tv/dmn3aZdfqEJOL2UDpOIzE+eeO3DLAZ6xU7aeRO0N3B3
	ufUR5UY+8yD0PQbk67p04C0Wv+bFbqwkWiz4IQMEuoByXvjroNYJtuRz4DvGr0oUCTAC/bDY0Pc
	fZN4koMq4sLU85PkBinvf5TnMZC0eXmjvfyph2Ix0IrbuFIAoEKLX/3OAH2zROH/PCMTU=
X-Received: by 2002:a5d:5f09:0:b0:48c:69b3:6114 with SMTP id ffacd0b85a97d-48db940d3c4mr39527378f8f.3.1792051435959;
        Thu, 15 Oct 2026 01:03:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac35dfsm17171447f8f.33.2026.10.15.01.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:03:54 -0700 (PDT)
Date: Fri, 2 Oct 2026 19:23:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: linux-media@vger.kernel.org
Subject: [bug report] [media] cx231xx: Added support for Carraera, Shelby,
 RDx_253S and VIDEO_GRABBER
Message-ID: <ar_aeUyAMFPPd3-2@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Media Developers,

Commit 64fbf4445526 ("[media] cx231xx: Added support for Carraera,
Shelby, RDx_253S and VIDEO_GRABBER") from Jul 6, 2010 (linux-next),
leads to the following Smatch static checker warning:

	drivers/media/usb/cx231xx/cx231xx-417.c:1354 cx231xx_bulk_copy()
	warn: buffer 'buffer' too small user_len=0-u32max for 3 byte copy

drivers/media/usb/cx231xx/cx231xx-417.c
    1341 static int cx231xx_bulk_copy(struct cx231xx *dev, struct urb *urb)
    1342 {
    1343         struct cx231xx_dmaqueue *dma_q = urb->context;
    1344         unsigned char *p_buffer, *buffer;
    1345         u32 buffer_size = 0;
    1346 
    1347         p_buffer = urb->transfer_buffer;
    1348         buffer_size = urb->actual_length;

Smatch and ChatGPT want an:

	if (buffer_size < 3)
		return -ESOMETHING;

    1349 
    1350         buffer = kmalloc(buffer_size, GFP_ATOMIC);
    1351         if (!buffer)
    1352                 return -ENOMEM;
    1353 
--> 1354         memcpy(buffer, dma_q->ps_head, 3);

Otherwise it leads to a crash.

    1355         memcpy(buffer+3, p_buffer, buffer_size-3);
    1356         memcpy(dma_q->ps_head, p_buffer+buffer_size-3, 3);
    1357 
    1358         p_buffer = buffer;
    1359         buffer_filled(p_buffer, buffer_size, urb, dma_q);
    1360 
    1361         kfree(buffer);
    1362         return 0;
    1363 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
