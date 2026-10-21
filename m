Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792587396;
	b=Inv1m7Soo9qQEiS1alUPWVcYou9v/8oTi3aYJPtrJB7cnHBrL/WpuCQihmAIx8W0lKEF
	 wZLeYNAxwdSkkq5rx6ZQ0m5whIIoaljeWIGkMts/3gkE4914fmgbSavUTS00q0IjqhGc9
	 gugRBMwGbzDngvNWn8GZl0NNnEr6AWTs1kPq1sG3ztdybK3koFWYidgVJBrfpUsYp0Yjr
	 CxfuvjVEFYLpDEyMHXoBGhCyZP+NCr5OZR55R4kfSGqJNpHPUzZmrF4lus/NY09i4T59m
	 JsbCgvpkZ4uj4bxo0Inmaazm3AJoYnC9dzJaQwuGEpe+Fwqe0C79U6QkJHjV/WtmDYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qi1H/TWXxLLxbGzzn39MIG1qXo5ZarlUhDNNloP8fkw=;
	b=OBOlmfCTDTFy+IIfgTIJF+07aH87U5ay2jfN/n7ZKW97hBLX6ZsXFxDRwdaYLHNzMXpe
	 JOoEUHvo519yL4A+9BRnJSohi+x4QQ8Hd1C7l3+2jTjLjA+HfFJeXXKv16peqHt4fgwXN
	 yWEBM28+zZ+Z+TVSmFKsUvHogho29PkpWX1Ju2VDSwypSP6ZoIuKQZ0UGMqfMtUUsjSNO
	 TbIek0f4FMKBijd6cO5/553TuBpUNZc8kDp0B0jBI/1SnaWOiVjfTJFHjlS7sfxlWs0Db
	 q16f7Hjf+2PtqaCCx4G8Nn3MyxHA5a9sjHzbpBNGysRBPrpzjN9UgVP4YTEL5Higj4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eaWpfOtj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D3D606A31A
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 12:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96D3D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eaWpfOtj
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36681e85e87so1347934eec.1
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 05:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792587395; cv=none;
        d=google.com; s=arc-20260327;
        b=Y4OfE861z0DdyYB8hHtAP4KCMwXaeBlFzGA7QmI1fqH+j81oZDL57sycr98iphsBGf
         PJDUtgNg2CbWb7cvF8WHDE8ppHpi+ErUFQhBLXGlHOlAgua416DiK6qLkDkwggMSEJqq
         zQiwrbBLbs9VLvqfMET0UcgtgV/n/PtalwwMyHI6edf1FHbdY1YCXV5gd8zFkcXgDuTc
         Ns9IcjR7YCM3oFjgujV1BpNujN8Gk6E8ie5LYQbV7wnUDEK2mYZ4uMVYWN1wE7/ng7q/
         NF8SPZoj8uI/hoo4XHAat8s2vUiaOcoaRtmUDg/kmWjkz3XmBr4HXVONLRkOKfBeq61m
         4o8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qi1H/TWXxLLxbGzzn39MIG1qXo5ZarlUhDNNloP8fkw=;
        fh=ffMNwY4eVSwocq723o24XgiHn7e3X4d4rCP61G8CEnw=;
        b=ObG7EEJHSssDY8BzB+Tlk/sQAtum5mbfmHKbaeSPlyJSR7HKZAmjpBJGO3yKjex2K8
         5m11s4CYk1vjOhzD65sZBwblkKyLnVEND7uFNkJQO0uj+8Dy3MV+GR6FhH1TDVRHUXft
         PMr384+H/Kv2qqTli7ifx7i2DxSExR3zTD/IqrxomvPh0+PVGJq9xX7fjh+i76yASAs0
         9RW3I5KDsXhMiJ3UTU64EEJCJ6MX4Bnn05RFCUTkc7rPtSzdaQ/azZTOVWfzHKgwCTag
         rBLa2D7SolI+pg1jjlp8UXyb6TMpc+TNm72xzU8ed31NhE/Z0H3QnwXcK9YOGHnk/55s
         To8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792587395; x=1793192195; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qi1H/TWXxLLxbGzzn39MIG1qXo5ZarlUhDNNloP8fkw=;
        b=eaWpfOtjLbTltFIYf/0HgsAaZYh4+RqTlDSj7tec+v7r59/ApehwoK1nURlUiXfZZI
         6SvUMBsUq/rYIJ2m4EYj6MpF0D1fd4QbbPIdCzTMB2srLqC/nLlzHhK00lWQmivmySbJ
         2Yb3ypiJ5ZMEkdeNof/W6HbNryu+jNzZTG4mWM55NSpjQhv4wtN5CyFbL4N9dwmf+7Zo
         bhTwsJwPdOwmCyT8NIOy+c/QJFqiHwkOBt+KczPiwoiQMZGJnBqjgZn3jSxc2Pv98IJs
         YkQyd+++KsorzGb0n0lCa3AplzuhYkXMK+wkdLmfACy4Wtj976iBqGlnhCg3MzVIelkZ
         QQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587395; x=1793192195;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qi1H/TWXxLLxbGzzn39MIG1qXo5ZarlUhDNNloP8fkw=;
        b=CFqbKrwlGk2lasRf3vjd5Bj6IajqrEhsAygCoZUKt5+AuWdYNandkd2+MhRYv/K3Hq
         8OikJvc4OMOPbuNMVRUEYByaHi0MdwxXDI4gALV3jPTJvKWYKrD0Fh5o+zP1ciQF/yHq
         EJYTjoUD2S4StQJijfLvqoRk5oijxtXmTvz8hPd0oyN8XPcmLjExXXJjGXK5iLHD18b1
         OsRzLZ/mI0kEluNvGy84VfjIthVXXDfOF1RgQs24YXyNjHWTCjbjQN8nUsT29P2PGWk7
         uT8UeDOYUFeBovUH9wt1h5xHNea4lp4TF4YabiFcZu9uF/taLnTTnZztHXM6ybf1ZjSi
         jquA==
X-Forwarded-Encrypted: i=1; AKwUvBwa30T22ypUPUgfghbv8AAXAEBIjIStDfhPM5IdytOMgPlg+aQHFO6kgMIprbegSSWY+JVUqLnC0OYJew==@vger.kernel.org
X-Gm-Message-State: AFq9FYJiFIHNwsYkkpG/zln1ZjZ/CiKkoc+CCJs0+m2CvvuYWAhbkkDa
	wRHk/a7xajJDkg1PTtU2WU5p88vZ2eGGH7cBqVEPWt+p4i0FAiA/YulaVbDoLB89qbOlAjKKi7p
	GHnw7ZiEO4ovIw/y0LtBe2z+PSqlae0KC937g
X-Gm-Gg: AYBFou0IrWwcs15rb596c0iPZTDk5ZL60UplZTymXZiW4KG2AG7gpl7gZkpVGmFNQEW
	2an0X+tUfnL7DeP8jLtiNueor4bcXzqvHf2Tga6jLFDD64FvfGHYWT3UUyoJ1IHQP84SsKKWs8E
	kDNDcnW53kCG6wLfdjEvoHS6NqMzjDTSN2IovDGDppqzJI2SoT4a+IyZORx9rMeNBq29fw4MHrA
	389TTirvh2teZNvaIpIjIBsbhElsf7zFTUr1FZwtqPeDckQzDq/YG8unRjIhgKJ1XIL8N6sCpxY
	Dlq4LYHY1uV1tFE9ihBc2mInbbvI6yutYnbuprGfNQuiLKLtE4yUTBcvqsOxkaKvNVrS6xvXLeD
	uBYD2i3j31Bev61BObjTcJcG5iswJjYRf37MRZhjy0zbZJxBOJ8X7GicZBMFyt5Yjvn33q67KyC
	fYOgfV1shoEahkL4i8UcA=
X-Received: by 2002:a05:7022:698e:b0:18b:755:ae06 with SMTP id
 a92af1059eb24-190a7661e5bmr3619854c88.37.1792587394516; Wed, 21 Oct 2026
 05:56:34 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-sv105c-retry-set-interface-v1-1-ab2f08bc3fcb@gmail.com>
 <20261019111712.GP595565@killaraus.ideasonboard.com> <449eb143-37a8-4044-a071-63fe495c0213@kernel.org>
 <20261019112726.GR595565@killaraus.ideasonboard.com> <CAAquLuDc==WsbOYTfuKV2tspTSQAvB7kg2r2aqbE2rs3tYx2LA@mail.gmail.com>
 <d2d5e53a-ba8b-4b66-8e15-0c45e08e0f3f@kernel.org> <20261019123803.GA855235@killaraus.ideasonboard.com>
 <CAAquLuBW3MaBZgxQt_Kr7L2jGQf6mXarRtKi729-44DqwC=CnA@mail.gmail.com> <f4c591d0-304a-49d6-8892-d28124767a55@kernel.org>
In-Reply-To: <f4c591d0-304a-49d6-8892-d28124767a55@kernel.org>
From: Ostashow Constantine <ostashow@gmail.com>
Date: Wed, 21 Oct 2026 15:56:22 +0300
X-Gm-Features: AclHuK9yOMjxMFyx5SOlfInswV2iCdARQUgVp5qEBKbxa42As5kbuxjFSrB3VSM
Message-ID: <CAAquLuAepobWS5N7CzwO4po2g+=CmtqDPZ9D1VQQiWfJFi6S7Q@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add quirk to retry SET_INTERFACE for
 SVBONY SV105C
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans,

On 21-Oct-26 12:26, Hans de Goede wrote:
> I wonder if it helps if you insert a fsleep(3000) here on the RPi case?
>
> So that is sleep between the Configure Endpoint and the actual SET_INTERFACE
> ctrl urb being send out.

It doesn't help. usbcore is built into the Pi kernel, so I put the
delay in a small test module instead. It has a kprobe on
usb_control_msg() that does mdelay() only for SET_INTERFACE with
alt != 0 on this camera. In usb_set_interface() that call comes right
after usb_hcd_alloc_bandwidth(), so the delay lands between the
Configure Endpoint completion and the SETUP. It was busy-waiting,
not fsleep(), but the timing on the bus is the same.

xhci-hcd trace events with a 3 ms delay, 5 stream starts:

  Configure Endpoint queued
  +0.25 ms    Configure Endpoint completed, Success
  +3.1 ms     SET_INTERFACE alt 6 Setup Stage queued
  +0.9 ms     Transfer Event on the Status Stage TRB, followed by
              Reset Endpoint, Configure Endpoint (Drop), Configure
              Endpoint (Add)
  retry       again 3.1 ms after Configure Endpoint, Success

The first attempt failed in 4 of the 5 traced starts, and the fifth
completed after 260 ms. So with 3 ms between Configure Endpoint and
the SETUP, the failure looks just as it does without the delay.

Without tracing, MJPEG 1920x1080, auto exposure, blocks of 10 starts
with the delay settings alternating:

  no delay      35/40 first attempts failed
  3 ms          32/40
  20 ms         29/30

Today the failure rate is much higher than in my earlier series, with
or without the delay. Every failed start recovered with the retry,
including the retries that also had the 3 ms delay in front of them.

> Can you try the camera on the RPi without involving the USB2 hub, or
> are all ports routed through the hub ?

All of them go through the hub. The VL805's USB 2.0 root hub has a
single port, and the VIA hub (2109:3431) is behind it. All four USB-A
ports are on that hub:

  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/1p, 480M
      |__ Port 001: Dev 002, Class=Hub, Driver=hub/4p, 480M
          |__ Port 004: Dev 003, Class=Video, Driver=uvcvideo, 480M

The only port not on that hub is the USB-C port, which is on the
BCM2711's DWC2 controller and not on xHCI at all. I can try it in host
mode if that would tell you something useful, but it wouldn't separate
the VL805 from its hub.

Regards,
Constantine
