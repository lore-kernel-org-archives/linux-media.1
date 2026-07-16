Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426DB3911A1
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 07:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784186224; cv=pass; b=nzWcRCUN4U+QXtfQ1IskbfSTqKrsqzstWd3XXdowH4V8mDX+P43B9UqbyFvlloksjmykC3RhYKjr4V/cSY4JxlXWhxYRgJq/a0+F5AoQY1erfQh6Dl/utRMf8RYTdycBR/4HHOAK2fuWCKYeYKMFqDL41EIjn9VxRwcI4dXrZus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784186224; c=relaxed/simple;
	bh=+0v6+AmSmnXnvnxnaUt43EuEi2IFaEcw7ROvVudoSg4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tWXTFe7vutO1f7qQ0AZT/xBe0cc8jb+NF4T4z8n1DIg55f/RQAl3872ZgRRFpABZ73Yat7R4LCCtA1Zhdhoqf0wk5hZh/UjlPgoEB7NT4eMEFrJS0SwYknZkZ6z8aAsL0xcVQPXRTMypRTqPp27VB6EULQCb4ERE28I+dovHRCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=robocurve.org; spf=pass smtp.mailfrom=robocurve.org; dkim=pass (2048-bit key) header.d=robocurve.org header.i=@robocurve.org header.b=KjQERCFe; arc=pass smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=robocurve.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=robocurve.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=robocurve.org header.i=@robocurve.org header.b="KjQERCFe"
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2cc7a345f51so41287275ad.0
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 00:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784186222; cv=none;
        d=google.com; s=arc-20260327;
        b=FK2vBVrCAZE/O5+G70iBvc/Tx1K54Zs/UJPV85axnVBtlMWu4WlAjBt3Y+nq52uJ0u
         sqVLT5IkwgEwyYsrXjQFy0eLAxvwdKMHIP/4D41P1mKl2vE0IwI9u3ZrdQO4wIs3THGM
         Ah3CALcVVr6aXEv3xN59eiGtIgHKdVRwxsDifkG41ACVWhoWYpuK9fSAoXGt4QwH3wQa
         rpL9LA/medVum1Zu+ZKnbmT3IH7uDkM8lq2xSa88gQAaZUjxeU0FMBBlrEzft13ue6I2
         MsrbF3ze3CDsww5e0I+1+GI55UZZQ2pGZSVR5CQam4Ftp/X+zHSU2iqVMUcc/Q1Iq4S8
         idDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Hp91phntbAF1YZxVGjPthoALCAtJICi3HOR1r0ZVD2g=;
        fh=KtAECjZI4NaIhzc7BC89ZffXtg2wmWHYT71vboSVFgU=;
        b=kTJER5Gg7FHXNL0iRPr+7dZhzGa/he9chRYymh7BB3Eo4nQE4B4/U0xjIZwBOA9oO9
         mFz76XYl5OunvctOivM6yINvdSmQLzguXVtl0B8Avf1FekXw+WGmehxRZrkhSiYbjY3W
         WyNWFcVUyJNOjOK4ehCx5MMt7B1l0jp3FS1e2O2dvvpAcEDj1Pyk3sCHuMfoCbyfAyFi
         qvjelW8a6uJ3xVnW/GqrlFMRgnM0b0YFc57sHBXTVoKbQtxZwc5McWS86DlE5iK4C0HQ
         WlWqkIqO7M7Umj9ytJOMC0vmUguUO2PD2m9WKXnYW3bRvQi9xULdoqhWdCs7EoQXQ24L
         Eutg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=robocurve.org; s=google; t=1784186222; x=1784791022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hp91phntbAF1YZxVGjPthoALCAtJICi3HOR1r0ZVD2g=;
        b=KjQERCFe0bkuGrJf8swbNZtmIkMWK5F4qRshqSCG2Yx243JEUPpsBgDuRKXD7Ms4ee
         ayJ1fbetrceuuQCKguLhOQhCm0uxMED3abmkPe5vRyY/ImgImFH47WYRdVNjh+Gz4oly
         KWqf/dbAlGWJotIRuf2hAW7Ik8GAd8Lg7PIqkamFP8hYGRSE8lwhjKlZuaV+SpKq4Y8I
         /DYMSwDbgKAaWHBq26TTTuFkHhUiLoi11kyHR7yn6LkgaAcQ/9tCLLSgTOwuLbDUEQvR
         pKagMk76cbiitc/r2Amuxghlhy7PFArGTKPduMmc3Lw2Vfhnt3qarNHnJwtUDRlSMUhi
         8WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784186222; x=1784791022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hp91phntbAF1YZxVGjPthoALCAtJICi3HOR1r0ZVD2g=;
        b=fqTpVkIrz3V6NCRPebV4COY96Y7ak33Fyqnt+XTrnQ66WZsC2NLi1q1gX++vrdKciE
         LI5YRy1jzsIzB+J6Fa+NGecefoNzg8j0LLFRqB0C5XpNb+xF8KsWLO0we3a7CFi2v1bO
         8GoQqhZjYFBewZuZdP07TkGDvnxXrpYR8gIbQDMHF7K9+JuDdJNAVG4ovU60Vl4PAyXV
         0uVAe35ITgSKJgOZyFQWkxdjpxILGsXgiLyWrhTYX9lDGdMXpWQpHTTepqmb1mv4xIs1
         Upm5BY4POQnwp5p+UYTdE1H5vxz+rgeyE1q+apu45cv90SoYFNqKt0HNrA9ufZZ0dXZK
         K7bQ==
X-Gm-Message-State: AOJu0YyvGxgphkUKuHoDPm2bZoxTCQX17k+XLc66DMykCsIdVVH2vRl9
	ORH115GwkcKk17pfzQ2s1FcKTqfL6nbWaPrIrFVozrlFhXUxETovem+uv7+dCY3hRN69siA84fp
	T2htgs4NvR4MSwVGWzpE5rvu3f3SfDAUi755Ks6S/79+JRw9upcGYlzzFXaMt3DeHGVc=
X-Gm-Gg: AfdE7claOlpCExI0V+M6ytBuwpc5hiOUvUglwENHhQFcuQXwg42v2/hfpx3v14nYbnA
	zcZmp5pw78OiaPUzf3NwweIaTDduyxYnOI+2KOV/4+i9lJZCgIkO2uj6r4OGDlggJFM4LpphpG0
	yLjr6sXxXDL1zp+erQ28gJziIJ6vqCCXWZYT9JX0Rymlktibe253bP4snKjdat18lyIo1qvm23D
	8YXpCSPi5sLmY52lbjUW+mcmG4CD4jBCLgStMtZxHwSjinCWrTZ2vN+COkVq1g=
X-Received: by 2002:a17:902:dace:b0:2ca:f16c:87b3 with SMTP id
 d9443c01a7336-2cf03ce7c32mr60897365ad.19.1784186222510; Thu, 16 Jul 2026
 00:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jay Chooi <jay@robocurve.org>
Date: Thu, 16 Jul 2026 00:16:51 -0700
X-Gm-Features: AUfX_myZqIvpF7WP6B--mfcemJ1G7ne6xyTnMYY4Q097_nUPgx2fxhrlkupfg-A
Message-ID: <CAL+2LXtmekL+oc8e48uUXL_2SXvfCc_v7MrHJ6JDh9usRHu0sQ@mail.gmail.com>
Subject: uvcvideo: deadlock when async control drops the last PM reference
 from the status-event path
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, ribalda@chromium.org, 
	mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

We are hitting a reproducible, unkillable deadlock in uvcvideo's
status-event / power-management path on v7.0.6 (Ubuntu 7.0.0-27-generic);
by code inspection the same paths are present in current mainline.

Hardware: 2x Intel RealSense D405 (8086:0b5b) and 1x D435 (8086:0b07) on
the same host. The trigger is ordinary control access (exposure /
auto-exposure, which these devices expose as asynchronous, auto-update
controls). With camera firmware 5.15.1.55 one unit wedged on most control
accesses and the other rarely; after updating both to firmware 5.17.3.10
the deadlock became deterministic on both =E2=80=94 the newer firmware appe=
ars to
deliver the control-change status interrupt more reliably, hitting the
race window every time.

Analysis
--------

uvc_ctrl_set_handle() takes a PM reference (uvc_pm_get) for a pending
asynchronous control, released by uvc_ctrl_clear_handle() -> uvc_pm_put()
when the control-change status event arrives. That release runs inside
uvc_ctrl_status_event(), which is reached from two contexts where dropping
the LAST status user deadlocks:

1. From the async worker uvc_ctrl_status_event_work():
   uvc_pm_put -> uvc_status_put (takes status_lock) -> uvc_status_stop ->
   cancel_work_sync(&dev->async_ctrl.work) =E2=80=94 cancelling the work it=
em it
   is currently executing in. It waits for itself forever while holding
   status_lock.

2. From uvc_status_stop() itself, via the synchronous flush
   ("if (cancel_work_sync(&w->work)) uvc_ctrl_status_event(...)"):
   the same put chain re-acquires status_lock, which the caller
   (uvc_status_put/uvc_status_suspend) already holds. Self-deadlock on a
   non-recursive mutex.

Once either happens, every subsequent open/ioctl blocks in
uvc_status_get() on status_lock (unkillable D state), and
uvc_status_unregister() -> uvc_status_suspend() blocks the USB disconnect
path, which in turn wedges the hub workqueue (usb_hub_wq in D state) =E2=80=
=94
after that no device on the hub can enumerate and only a reboot recovers.
System shutdown also hangs indefinitely waiting on the D-state tasks.

Hung-task stacks (Ubuntu 7.0.0-27-generic)
------------------------------------------

Blocked ioctl side:
  uvc_v4l2_unlocked_ioctl+0x97/0x190 [uvcvideo]
  uvc_status_get+0x1d/0x90 [uvcvideo]

Blocked worker side:
  Workqueue: events uvc_ctrl_status_event_work [uvcvideo]
  uvc_ctrl_status_event_work+0x22/0x90 [uvcvideo]
  uvc_ctrl_status_event+0x77/0x180 [uvcvideo]
  uvc_pm_put+0x12/0x40 [uvcvideo]
  uvc_status_put+0x6d/0x80 [uvcvideo]
  uvc_status_stop.part.0+0x22/0xb0 [uvcvideo]

(Full traces available on request.)

Workaround we validated
-----------------------

A local module parameter that skips arming the status interrupt endpoint
in uvc_status_init() (no events -> no worker -> no deadlock) eliminates
the hang across repeated control-access stress on both firmware versions.
Expected side effect confirmed: pending async controls are then never
cleared (GET on them returns -EBUSY indefinitely), so this is a
workaround, not a fix.

Downstream report:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2160752

It looks like dropping the pending-async-control PM reference must not
synchronously stop the status URB from the event-delivery contexts =E2=80=
=94
e.g. defer the final uvc_status_stop() when current_work() =3D=3D
&dev->async_ctrl.work, and avoid re-entering uvc_status_put under
status_lock in the synchronous-flush path. Happy to test patches; the
setup reproduces the deadlock within seconds.

Reported-by: Jay Chooi <jay@robocurve.org>
