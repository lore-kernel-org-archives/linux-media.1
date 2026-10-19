Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F894E73C4
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 11:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411133; cv=pass; b=jUlJOVv+CpdIxnrqLW7prWLJWPj3zv5/X5iiMWgesKYsvILGvcZrMWVT5q9WgS12KrU7Fd7WYheS6w2cmh82y4z1dHK+CYJoTiD3KlP4nv9z1k4x70pQckeW86iW+HpuqRWD3qQOoPgknVREJBdtN8VV419C4UFFhKm0g4feHuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411133; c=relaxed/simple;
	bh=fj67lO3edxVDgvlqN8Zdz2Nd2dpZhUF61eD8eEdkb48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYAxpbigGoIIpPQpZOTWUYawYI1m+hrgGXtYZAhzdNOSTib2PEKuPMsfXn9f8CxSGDNO0jJCDuiaDeryOD1NcozO/xt+jZaOYPIrYJqRi8i92+RZIr+qIxROZvNJtPzo/6X7dv7ToZgu4M/EgFbpINQGbxAegNZurtlgWC5j1a0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDIy3Et4; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDIy3Et4"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15354aa70e8so913745c88.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 04:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792411131; cv=none;
        d=google.com; s=arc-20260327;
        b=kRS4z21HG/2BYjp2+74mCTTfVayBoRM1oZU9TpmYeIJ85AGA/3pktp+Eprdpm+Hykm
         kqG+Vm8eTrd1IJO/824/yG+1BRyrnBZK1onOvVm7wuBx5u/wCwLLbVygphu6mIBgKN5u
         ax9HNwIKqWROZ0zcdMJbZetiXKsUp4Bo8AlL1xpTv85tsN/kUmXwjUVfbGnnov2QVg4T
         8kC7cjcvMt1HEiEQPl2h6pqGde3MSVDuq60Swvc245aq2+1ydvT9WRX1CKlQGCuVCsE+
         Jjy+iAug53YLyceKfqlkmKn5cDJwM5RIhFXBQd7+HtLOrh24UFIxOE/LG8pM9FbGaqRY
         Fdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5dYf1TZbMSijaFd8YK2BOfOlVhvl2NvNeNo192tf8ws=;
        fh=F4Fb1Jx1luRhgnp3R/eYsjBz+lxLz4BGo4SeNjD4PnY=;
        b=iYqG6mp5RFQoQzm/AUotwIlusjjj7Dbql4pzwEqwcxC0vnCWmWqtu83FdMRAHnap5v
         8ANufye1N1f1pVekneTNJSbiKrm6+uI470LXasE09oI2vuBASkzUwevzPDjTQfKkIZmx
         l0z6RRe8k3geqjZtOk2ygXIaBcO/ntRjOqVbtN6nYFCUGgGll8pyp4HtxvZEliKLN1Oq
         0iXEpE6PUWafb8eb/6V2FykuX+Kd/PdydrbJvaWl+oKvrs6oITJGCl5DbpuaJpWXw4ew
         9wRAog/ulkqHCNStBdey3RJqx/vMlw7ZbBxVC7JPSBZVL/jqDFvoixN5MplgGhezdSxE
         o/lA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792411131; x=1793015931; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dYf1TZbMSijaFd8YK2BOfOlVhvl2NvNeNo192tf8ws=;
        b=QDIy3Et42ie3HmL9JSktzNb4ORoabqjBuSrlZyRkuMN1+mxRsRV4i8lRladWf7Y20c
         hny7aH4j/crwsBSDWsgc4eEM8kukyiNEnOoomrC8SnkAp62K8/+Sb132b5p78KUV1/em
         JA1SHWa3RShBRNIR5MZ58pxR/2KEkADY7IIcb8yfOjGMWmFby/JLvTG4Rk0Xx46v7K4r
         0/oQVK0MJgfLQW5BhMSuRl7DELX0vnRF2SHajAvm2/28rFK2OU09LQyOwsRXnk1P7Ij1
         Lf6bEXmnZ8eyzeBvf3gnFjSLvRTqsZpzAj2a4coZPUZk2v9/JXRwRJNzDb3KlVc7kBGH
         VXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411131; x=1793015931;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5dYf1TZbMSijaFd8YK2BOfOlVhvl2NvNeNo192tf8ws=;
        b=Vb2YNU0Ug5Fu3wp2QdE41tWSxF1/Jat8PcRN7AdrdLQ+Z08wTV9zvuNk3/ysh82Lcr
         ZS3EOiJB9kbLcit3V0QhUTi+RGqkxq4RGCvabEYv5b28+52xK/lsyoEdmCoxbTiuH19M
         IIflXFvyIPXdg9UkrpHd2FKasbhORH/B/Yr9CdmYw0kFVYjOzJ4yY2TWKcrhEB3TPZJn
         3xV2MAt7rNo2c7SVYTyJwjV4KGPswB4w320KMhUQhl/1/VyrVZQA4uOGW5GjrZqxWcU3
         OQLw39BTDyqCiBKhvUooeKmHez2m4PjlmTY7DWb9YWlz3ykzbOeSZ8difPL6W4Ib0uft
         JOTg==
X-Forwarded-Encrypted: i=1; AKwUvBzNKRBs9uU+KCBV6yZe0ybgkDEgp9mfxVW77qG0oTt5AyzB5dMtYzO5XSiKEhMUSN++EqFNucd73Dkd4Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIwOJYid7lZrPuaCVhe/YpuohXehoqPCTrd9rHmc67+BhlzBEhs
	TzDOmW5Dhff8yx2tLxDmrwqqhrKII/tZgcg8eNq4TP7YQYPzMPzpEpf2iRlkbIFu+vqbo0VmIZn
	QTU7rIbYZCOa66R6UiRe2+1Mrn3IiJBpKfNf4
X-Gm-Gg: AYBFou0kS1v4+1A6VXujF0BEbY/m5vJviK3vqPBaB5UFuXurHMMYlZrluDzPfBU14hO
	ByVLwHxjY+9cyHPhRi4iTTxCPKS10Dcy8SNb2MrFeVn/HWInCXVAhkVvu/AuRsJFVd7BbzEAXX2
	QtAuvhOf68IRlY3a/52nGZBVrF1bra4W2tCv4WFnXNocGNQ13O9vPwg6x6eV9ge2w4L7mgG9Uoy
	F1cIcId/9LwJ0mPi4FeM9ivWdzmb9eros4W/QVxfixUlZI8HJAo3Nx41EruXTrJupTkzYc7OIaV
	6XC7ibOzizn17QczmJUr9sGG3+nSyt00rt0OvpWJsVr4IOk32Py3BJLvv0EMZBo8
X-Received: by 2002:a05:701b:260d:b0:185:6b47:dcf with SMTP id
 a92af1059eb24-1856b470e22mr10309664c88.36.1792411131321; Mon, 19 Oct 2026
 04:58:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261019-sv105c-retry-set-interface-v1-1-ab2f08bc3fcb@gmail.com>
 <20261019111712.GP595565@killaraus.ideasonboard.com> <449eb143-37a8-4044-a071-63fe495c0213@kernel.org>
 <20261019112726.GR595565@killaraus.ideasonboard.com>
In-Reply-To: <20261019112726.GR595565@killaraus.ideasonboard.com>
From: =?UTF-8?B?0JrQvtC90YHRgtCw0L3RgtC40L0g0J7RgdGC0LDRiNC+0LI=?= <ostashow@gmail.com>
Date: Mon, 19 Oct 2026 14:58:39 +0300
X-Gm-Features: AclHuK-LRHqWo9ViJ33OiTVWU8haG9ETAHoju0Ier-hutiYfpJ9-Czbp4j4W_n0
Message-ID: <CAAquLuDc==WsbOYTfuKV2tspTSQAvB7kg2r2aqbE2rs3tYx2LA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add quirk to retry SET_INTERFACE for
 SVBONY SV105C
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent, Hans,

On Mon, Oct 19, 2026 at 02:27:26PM +0300, Laurent Pinchart wrote:
> On Mon, Oct 19, 2026 at 01:21:49PM +0200, Hans de Goede wrote:
> > On 19-Oct-26 1:17 PM, Laurent Pinchart wrote:
> > > What does Windows do differently then ?
> >
> > I guess Windows always has a short-delay of at least one USB frame-time
> > between the VS_COMMIT and SET_INTERFACE. I think we should simply add
> > a flseep(1000) before the set_interface instead of adding a quirk for
> > this.
>
> The commit message says it doesn't help, but I can't tell if that can be
> trusted.

Fair point. I have measured both sides again.

Windows 11, AMD xHCI, camera on a root port, 120 stream starts with
ffmpeg/DirectShow (MJPEG 1920x1080, and YUYV 1920x1080 for 5 of them),
captured with USBPcap and an ETW trace of USBXHCI/UCX/USBHUB3:

- The requests are the same as on Linux: PROBE GET_CUR, SET_CUR,
  GET_CUR, GET_MAX, GET_MIN, SET_CUR, GET_CUR, then a 26 byte COMMIT,
  then SET_INTERFACE alt 6. There is nothing else in between.
- The SET_INTERFACE URB is submitted 22 us after the COMMIT completes.
  The xHCI driver first runs a Configure Endpoint command (3 ms), then
  queues the control transfer. That puts about 3 ms between the two
  requests.
- The control transfer completes successfully after 263 ms, every time
  (402 ms for YUYV 1920x1080). In a 100 start run, the ETW trace shows
  exactly 10 control transfers on the camera's EP0 per start (8 for
  probe/commit and 2 for SET_INTERFACE alt 6/alt 0). There was no
  Reset Endpoint command, and every xHCI command completed with Success.
  Windows does not see an error and does not retry. 0 failures out of
  120.

Linux 6.18, Raspberry Pi 4 (VL805 xHCI, camera behind the VL805's
internal USB 2.0 hub). I added an fsleep() right before
usb_set_interface() in uvc_video_start_transfer() and checked the
resulting gap in usbmon. 20 starts per value, MJPEG 1920x1080, auto
exposure:

  fsleep()   COMMIT -> SET_INTERFACE (usbmon)   first SET_INTERFACE -EPROTO
  none          0.35 -   0.90 ms                 1/20
  1 ms          1.53 -   1.84 ms                 2/20
  5 ms          5.42 -   7.26 ms                 6/20
  20 ms        20.4  -  26.4  ms                 3/20
  100 ms      100.7  - 108.1  ms                 5/20
  300 ms      319.5  - 325.2  ms                 1/20

So a delay does not help, even one longer than the time the device
takes to complete the request.

The timing differs between failure and success. A failing
SET_INTERFACE completes with -EPROTO about 1 ms after it is submitted.
A successful one, whether the first attempt or the retry, takes about
260 ms, the same as on Windows. My guess is that the device starts
reconfiguring right after the SETUP stage and sometimes fails to
answer the status stage for a few microframes before it starts
NAKing. The VL805 then reports a transaction error. I have no bus
analyzer to confirm this.

I also need to correct the commit message: the failure rate is not a
stable 80%. Today it was between 0% and 50% per series of 10 to 20
starts, with auto exposure failing more often than manual exposure.
The retry always succeeded on the first attempt.

With 0 out of 120 on Windows against roughly 15% per start on the Pi,
the difference is real. I can't tell yet whether it comes from the OS
or from the host controller. I haven't tested the camera with Linux
on a non-VL805 controller. I can do that before a v2 if it would help.

--
Regards,
Constantine
