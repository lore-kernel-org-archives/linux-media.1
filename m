Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945522BDC1C
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 17:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973479; cv=pass; b=BqwXSNl7my/Sch86HVQf9nS22jARZqlHpPfiGwAdJS70fEvWWHsVw4ayJx01qTsGxpNqsyp+V8K/FJlDwLQxW0xBLXzTI1w0k29afWsirwBBcK2AdlByqr/3fBLEZUONEvFPTcPEUTQfH0SCpfSgRh79JiY3w9kf7CGeNJTwuDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973479; c=relaxed/simple;
	bh=zNRJAWDpmSyQxf+gq4P6PYHSTb8ilgp/59JSal2jEFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+vx4e8WY7Kj4qCJAmA7ozAV9wOZ6NxGkxPUw0JV7BktlCDscP+4KhIDJ5zbhLg1aYsuvZ+MX81syEztKXarPCckBf3mZygC+3GP1ujLSorArU7nYjplwhf8QqXwiQl4mS8nIdEc56BNwElq13KVLlAQIW4xJsVikPuQ2H9a9LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esX11EV3; arc=pass smtp.client-ip=74.125.224.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esX11EV3"
Received: by mail-yx2-f10.google.com with SMTP id 956f58d0204a3-6710ded3968so195136d50.0
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 10:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788973476; cv=none;
        d=google.com; s=arc-20260327;
        b=B7ctJnVmY0jkRntXXmtpJIM2lunq6Qk+A+85XouBZPu0bARh6g28PdWsYYdvzdmCuA
         Ae2A2i5hDPA34Eq4Qz+DS9ezJuhJ9kjjjWrAfrLTdrSg+p3DvzBWbWpGb9DRS74Fz47/
         ueRdyC8MDrSdu3nDH8C7njy1jcmd37O02w8o4XELBFsev+9c+ekBcZ/vWMQaBpsWZeMI
         C89TMqdBKctgcGKdN27qq8J3zfMt9YiYLQO50WyjeAsHcasHj0EIzlp33/hn6xbGmEyI
         GHvxxFcQbFrAjyLr5wQyfFXBXBB4xLXk9VewPQ48SK38DoAdOMFLGuAwT+x4brxLWZ3I
         B6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=h68yUZkKyOQMox/zVW7HECZ4MPmqpPFgYdtPt3ny8hI=;
        fh=NgaTrv+jl2HyW43UZ/M51d2xwIxZv4832gPUm+WmDJU=;
        b=SLTgvenAWJ9hMCGNzlHGOAL0IbzHFNA1FCsQ0RZqdciFzN1Zve+SiI8+kCSR8RjfR5
         i9zGEEOc6GrqtaK7WUwWxHhEHO7sVfqv6MIuk5XVJPXSHScGpxwkI1z1WKVbOwv9GHKu
         UwwaNjY3e2e5CiHYQZ93e2Yv9i+W7H8snNCRhYs5KUYia88yxhf8KuHvEUEAqFLiU454
         mKrCfPEMxQ1S0pViTfTvzKsCjJDvK2E3Zxv2yUK73KOBcfAcGgf+ti5D/CQOw/VFxJ/n
         w47Rf8zoNFlo1aqLxpMqt91obTbFGH9xqM7QqTEg2DLD5wUuI33JpDAi049Jc9lzL03D
         qkHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788973476; x=1789578276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h68yUZkKyOQMox/zVW7HECZ4MPmqpPFgYdtPt3ny8hI=;
        b=esX11EV3970/+DlnWiJUQ0JrEiqdjYpR0xOVzhmyO7gZzRA2ZzDLWTK6w3wa0s27l0
         hbs3g7Zf8mQWRSYpmxZEqpffB+zsoORKdeCZSJmhMisUzeqb7JQPbMa8/Qds1Y9YHLoz
         YU7i7vEWP2CRduV7ldCz7OXcDe9aaoW/lSN3eVnIbOfNnbx/1J+fuYvAGNGFi5mWIWF4
         PFAU2fXdB7UFgvt26wgvQIDhxXL0HIENTzEhjDQOitXZxhMpiVKqpmxRG2jnIAq137YP
         g35+hMHG2fpySTixvvE9RP2s8sv+OFoieqCS6jKYkc72IuiIPL/A2jjlpho/378ed87N
         2OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788973476; x=1789578276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h68yUZkKyOQMox/zVW7HECZ4MPmqpPFgYdtPt3ny8hI=;
        b=r8uI8ugXvMMamBjqq8k65jPyKcxLyDYi5gx1/JjFq0UZrk2CrZ0rtXDndGZymC2fNj
         zA7rA9Pc/c8BVaeu0M5QnGJOepvHbx4pfM6vPqaLq638NzKXCMiF4Lrq7WmfXE/nf6tm
         1Zsbqf/Eo3hkgoxJiPNi/ouMXE3D4yLr9RIwRqTczQvT7m/vcE5BmxbywpEBpPlY+j4T
         6ZbVrbnwZhw8YuNImDJP3ugm2LYYc4Jg+w6fIWLiFDxA3h1sUPYDVMC8/bIC4dO6rRok
         zn4TcaGUNTZFAof2iSwR5sfHgBtjsiRlay3ZsLsaInG/m3dgTeO/ezNzzxYHIpQDZTm8
         UGeA==
X-Gm-Message-State: AFuF++lbIP22OjLjQvCco22QH0i28BzucZ8/3vBMCG6z/jOiJ7wsCX2M
	S9hvU3AzJ6/maxpUluXwwvnvmTYvXYEx3i7bufPsysdFwFC2Julw+zkkxEQnHiJOiny0VDrLbGF
	l5+Uz+A2leUxFHCfQx1lHpyfjt0x47RE=
X-Gm-Gg: AYBFou1nxFZCl+szSRQlwEnNWJ+yXGrZuAzHqEaeaT29FgQ4nBC2XCAevXdzfeN8C8q
	APk2bgWiMskP1+a0A6gpt3NbBK8Npn01gb6+F1pWilLq+xeWoWTlhozw5heduFDYOAx6UyZ+CP0
	3Z+TloXIsUjI2P2moczg322hUJXf4CkzcgF/JzUrvcqBMI7k679JhKkNSvWhOgSdVb28rYu7wOZ
	DY3GYY+R19dVoibGG7bFyJ17MW2mLMgTrHYHE1fRWR79tV4x0XUqXZ+5nVZYwbdRq8fDAOd37AS
	jmtSHNIN3TJ9ND4+NzsYHaJCF232q37cMZUzFFaFSYwxg9RDhCSDL7VpD6Yj21Fo1+pQvTI0p4J
	OMrZ7jSWvJf1crdKaBgBvEKKq6j1fQWxj5W8xsrNdbPv+Zqr9FyfM/sX36GXaCWhDY3edRJw=
X-Received: by 2002:a05:690e:43cf:b0:66d:273e:117a with SMTP id
 956f58d0204a3-6710ff00773mr1220253d50.39.1788973476283; Wed, 09 Sep 2026
 10:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHzb5FEEU3+aw8z6-_3yxDeKgZoLRMGyUSmHettjJvbAetraEg@mail.gmail.com>
In-Reply-To: <CAHzb5FEEU3+aw8z6-_3yxDeKgZoLRMGyUSmHettjJvbAetraEg@mail.gmail.com>
Reply-To: www.rokinthanp03@gmail.com
From: Rokinthan p <rokinthanp03@gmail.com>
Date: Wed, 9 Sep 2026 22:34:19 +0530
X-Gm-Features: AcwNN1U-LckANOu25TWKJ6Y_QMHpGD2IzN4hcXhSspsZzhvVHSuyrWdUHiqq9W4
Message-ID: <CAHzb5FFHj3WG93sR5sXb6RYAYC=v1QctLQstau3b=sDizQ2Ang@mail.gmail.com>
Subject: Fwd: [PATCH] media: hackrf: defer v4l2_ctrl_auto_cluster() until
 after error check
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cf896de36144391bcde1@syzkaller.appspotmail.com, 
	syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Rokinthan p <rokinthanp03@gmail.com>
Date: Wed, Sep 9, 2026 at 10:30=E2=80=AFPM
Subject: [PATCH] media: hackrf: defer v4l2_ctrl_auto_cluster() until
after error check
To: Mauro Carvalho Chehab <mchehab@kernel.org>


In hackrf_probe(), v4l2_ctrl_auto_cluster() is called immediately after
    allocating the auto and manual bandwidth controls for both the receiver
    and transmitter.

    If allocating the master control (dev->rx_bandwidth_auto or
    dev->tx_bandwidth_auto) fails, e.g. due to memory allocation failure,
    the pointer is NULL and the error is recorded in the control handler.
    Calling v4l2_ctrl_auto_cluster() with a NULL master control causes
    v4l2_ctrl_cluster() to trigger a WARNING:

      ncontrols =3D=3D 0 || controls[0] =3D=3D NULL
      WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 at
  v4l2_ctrl_cluster

    Fix this by moving the v4l2_ctrl_auto_cluster() invocations down after
    checking dev->rx_ctrl_handler.error and dev->tx_ctrl_handler.error.
    If control allocation fails, probe cleanly aborts with an error without
    attempting to cluster NULL controls.

    Fixes: 81774395a8d9 ("[media] hackrf: new driver")
    Reported-by: syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com
    Closes: https://syzkaller.appspot.com/bug?extid=3Dcf896de36144391bcde1
    Signed-off-by: Rohinthan <rokinthanp03@gmail.com>
    ---
     drivers/media/usb/hackrf/hackrf.c | 4 ++--
     1 file changed, 2 insertions(+), 2 deletions(-)

    diff --git a/drivers/media/usb/hackrf/hackrf.c
  b/drivers/media/usb/hackrf/hackrf.c
    --- a/drivers/media/usb/hackrf/hackrf.c
    +++ b/drivers/media/usb/hackrf/hackrf.c
    @@ -1427,7 +1427,6 @@ static int hackrf_probe(struct usb_interface *int=
f,
         dev->rx_bandwidth =3D v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
             &hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_BANDWIDTH,
             1750000, 28000000, 50000, 1750000);
    -    v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
         dev->rx_rf_gain =3D v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
             &hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_RF_GAIN, 0, 12,
12, 0);
         dev->rx_lna_gain =3D v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
    @@ -1439,6 +1438,7 @@ static int hackrf_probe(struct usb_interface *int=
f,
             dev_err(dev->dev, "Could not initialize controls\n");
             goto err_v4l2_ctrl_handler_free_rx;
         }
    +    v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
         v4l2_ctrl_grab(dev->rx_rf_gain, !hackrf_enable_rf_gain_ctrl);
         v4l2_ctrl_handler_setup(&dev->rx_ctrl_handler);

    @@ -1450,7 +1450,6 @@ static int hackrf_probe(struct usb_interface *int=
f,
         dev->tx_bandwidth =3D v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
             &hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_BANDWIDTH,
             1750000, 28000000, 50000, 1750000);
    -    v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
         dev->tx_lna_gain =3D v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
             &hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_LNA_GAIN, 0, 47,
1, 0);
         dev->tx_rf_gain =3D v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
    @@ -1460,6 +1459,7 @@ static int hackrf_probe(struct usb_interface *int=
f,
             dev_err(dev->dev, "Could not initialize controls\n");
             goto err_v4l2_ctrl_handler_free_tx;
         }
    +    v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
         v4l2_ctrl_grab(dev->tx_rf_gain, !hackrf_enable_rf_gain_ctrl);
         v4l2_ctrl_handler_setup(&dev->tx_ctrl_handler);
