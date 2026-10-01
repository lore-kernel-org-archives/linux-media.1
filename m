Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9733C060F
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 22:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790893058; cv=pass; b=qrYmbz5s0f7ZcsLNjVpydn1L+d/9H1EAE13nJba0rba7+e/QEDjf8j56OaBnlwQjU2Dh9b8wl/AnGh6jzs3VobqSX5TP7d+XeAPiEJ2bK1+68WiBXluWAuKQj66tcdHFdk4gIaRlrNSTnLY6S3Hx4lpbJRDHzd9np/HljCzRQzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790893058; c=relaxed/simple;
	bh=moiLJF31S6vVTOsVKtV9lRYkXUMG654AkWGkX05F34M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=odGW1+gfP0qd1KXSQ+elIJE3xNNqNrGwcpFaMq3upQ+4hB1rrMDfgkAjqhHjEf899L5Qb2+eEDs5NX9pxcdvDtVHID1gzNalTvCrCYsK37oWpI9/W6UuArzcx1XEtq22pooVEerYcDlCZUJICAjPTjEc3D0r4/S6oGy34jTWyS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=piDK4YEC; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="piDK4YEC"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8ab445ac183so45842637b3.3
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 15:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790893056; cv=none;
        d=google.com; s=arc-20260327;
        b=rwVzT0wNNXoE9d77/ZaDjbklU3NjhI9c3ADjss3dUT0UfJOM6CnmxRYni4JeBd9PSW
         pfgL7ZFdycAVsnqgS8Cfp7KqFQj8oXUEP+0dXOvumo4MujsW4Shq7Mgkgvacbu9ZES6z
         eG0l97ODU9+0QZFZFBQXaZU1ZW6Jd5tOzBcCOB8BS5haEzHTnUR580uqeM/+ZS/MITTl
         5QMviN+JXQbZP7cnmXtRK/ojfQcAWLIrsG0fxRxsInrMqzWUTaxNHphVlOImnCZoMDfm
         5gMs6mKCVWVfUKtWSgQ49wh0PLRT0jy/EqIDMd9nyUFmYkaZhTyYB+C16nM6gysbzXaz
         idpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=/XDU0FZ6HMbzwlIOklQvusOqb4kZ9TT1LQEY3p6zjxA=;
        fh=bgTuDVd8tqBDCvoBSREeXUbrqaN5rYCDXrY+0Zn3414=;
        b=JrlTPd812kqzco3Fw1KgpFTcMM9MN9vk3RJl7KQEi+AMO9ODbXRoeA9imio/naZgel
         Fb04PqteIo2RV5YAI9ZS5x7uSMCHLM2hXuxnRkZsJYqVQVcCuwUO/QApWAn6qV2D6Sbw
         +WsnN9wcWuz4esQI5+Kf6dgmwqOS9dxOL2YC3vqbbpMM92OE4MSM1nCdGeQvTucyDsRd
         ReWsbz/Rlp+sdUZjj/Oh6wAIPGaHxP/U8LW39OtK6QduqCdzRRP4hcWirYLYvVCj49kI
         jfek4XoN9kjPkvlUKaPGLixCHV+LPqXfXk2KMkgd3dbKZXG4ZZ/NuI6SV4Y9zeqxQ0ok
         4b1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790893056; x=1791497856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XDU0FZ6HMbzwlIOklQvusOqb4kZ9TT1LQEY3p6zjxA=;
        b=piDK4YECyMxVi6X41cxu4uDUwQn2ypoeVdem/lvhHoH4eG9WK+TwBCaQISIF2QCUGM
         zcDp/5opOHm61SHf5ktU+IxiNPSZsxF2xdrnWjDqoe+taVk6+vVmuFI22hoyQLJwKqhB
         OHl44MmDiE6zXUENt7AUaaUU40BNnc865PkJDmp4zJ0Di1hmeM3eMuG/9Vw7V3aTr2yM
         uoCQqAQJ9WuGy0L34R9VEDhwoTW82dHQoKtZH3jkaTZw3SgNUgFDgC6ZmjsCDa3yEk7+
         rs+va8K433P0+NirG6W+SLHY313tFQTfjAEW7EMrKO0rKmZtX1N4pwmwpQ7bBoKZZK/3
         QyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790893056; x=1791497856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/XDU0FZ6HMbzwlIOklQvusOqb4kZ9TT1LQEY3p6zjxA=;
        b=inOsCd+syGuVkNentqUyGdoi0ZPPVEB/wUO1gtDijo5Ue/+q7dtMxXu6Wi8N8QiZr1
         CP+cBn2vxuZydYvLSe8ftrcwxq4p5vgw3+QYpIinDEfesGjBaAgJ74UEQXrpgmBIBZA/
         r0lejgZs8ZwePw/N0KhGBq2qhD1G3H6ael7fXL/rb8gaVwsvSlOTBQI0KcGrFO8355u/
         9ajN+wdAnwrpViB1A8Rc/Uui4fiZAmtlJjqNiK87S5Ltk0lJAk/wIFUE0NqhwWA1Xhl6
         SGGqYFm27Nhj5YsWpmxijvrJcRAy6/22FelSf4UHtmgyCxyr3Thtwtn7iUIon4wheMUH
         Ou0Q==
X-Gm-Message-State: AFq9FYJ7HO+zrC0gqK2NoyOq1RpfbZ++q4TNqOI8q6Y4Wt3nQIfrewe3
	yOrtMUNdVgY1Hl8OZce6LbYuvq9FX9cWlfJ0S8ePeEB3MljzILuxUZG2ih8dlyKErPS8yJIxIH9
	CZyS54GcrijclWnfaM5xr/BVj86fbj/Zrd+VCNNY=
X-Gm-Gg: AYBFou0UKdZ3ttqOEpsKOlyPhYsVhHqAbG3UCK+7nI520aAcW1vhmdJnqJZB2GaxMtf
	kVnjKWJHyKuKa83gUp0fWvGvDHCr3myt9ziAJcEdgyLVds8KNgZmGOhCOzC3+Lgrkm+tDavsRb8
	4D10QNlrbGD1G+wiIuBcbfNov3eRxJhdUpw39T1BW4+i4xNrnmbUByZxtsdM8GAfJvXAW3FwIpu
	hE6NgIOZz6fDtMfM0w4N/KNNBPvVvbq5QIf+hh8y6dM9U1lMiER4pzgAmVPggOyynx31/SOpQzG
	UyyDAG5YyuB+08m8mtrowHKoY++3YQirI826zp9YSu+IM0wHkISBnXrJA8QIP5SRC8CyyVtMF+1
	XQ/LeDjQ/3wI+zn4dh9rsbt18FB37MsjvKh+pzoUXwd8ihg==
X-Received: by 2002:a05:690c:c50f:b0:8aa:2207:60b9 with SMTP id
 00721157ae682-8ae399a42f2mr4061457b3.20.1790893055774; Thu, 01 Oct 2026
 15:17:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: leone 1337 <leo.vernisse@gmail.com>
Date: Fri, 2 Oct 2026 00:17:24 +0200
X-Gm-Features: AclHuK9AEdDVpvcSnKRgpDu2-HXISQI4ih1r8S951DbXy8W1D3jvmlIvxf_xBms
Message-ID: <CADah2-fgdwyZOiAEnK6XAe5qLP0mHNRBH6DebPN+XXdgrM+fyQ@mail.gmail.com>
Subject: [RFC] uvcvideo: Realtek 0bda:579f sends multiple variable-length bulk
 payloads per URB
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I=E2=80=99ve been investigating a long-standing webcam issue on a Razer Bla=
de 14
(2017), using a Realtek USB camera with VID:PID 0bda:579f with the
help of Codex.

This appears related to the issue reported for the same device in 2017 and
to Julian Meyer=E2=80=99s 2020 work on handling multiple UVC bulk payloads =
inside
a single URB.

Old report:
https://sourceforge.net/p/linux-uvc/mailman/message/35729061/

Kernel bug:
https://bugzilla.kernel.org/show_bug.cgi?id=3D207045

Previous patch:
https://lore.kernel.org/lkml/20200420191506.664877-1-julianmeyer2000@gmail.=
com/

I reproduced the issue on Ubuntu 26.04.1 with kernel 7.0.0-38.

With the stock uvcvideo driver, 12 of the camera=E2=80=99s 30 advertised
format/resolution/frame-rate combinations fail. For example, 640x480 YUYV
returns buffers marked faulty and shorter than the expected 614400-byte
image.

USB captures showed that a complete 640x480 YUYV frame contains:

614400 bytes image data

+six 12-byte UVC payload headers

=3D614472 USB bytes

The additional payload headers appear at 512-byte USB packet boundaries
inside 16 KiB bulk URBs.

One additional observation may be relevant to the previous proposed fix:
the camera=E2=80=99s bulk payload lengths are not fixed.

For one negotiated max payload size of 119296 bytes, observed payload spans
included:

103936
107520
128000
129024

I initially tested an implementation based on the negotiated fixed size,
but it failed during live capture.

I then implemented a device-specific uvcvideo quirk for 0bda:579f. For
this device only, the bulk decoder recognizes packet-aligned 12-byte UVC
headers using FID, PTS and forward SCR continuity and splits multiple
payloads contained in the same URB.

The normal bulk decoder remains unchanged for all other devices.

Testing so far:

    - all 30 advertised YUYV/MJPEG combinations pass
    - 360 matrix frames with zero V4L2 error buffers
    - all 192 MJPEG matrix frames decode
    - 5400 complete 640x480 YUYV frames over ~3 minutes
    - ~3 minutes of decoded 1920x1080 MJPEG through GStreamer
    - repeated open/close during mode testing
    - successful capture after one S3 suspend/resume cycle
    - ASan/UBSan testing of extracted decoder logic against captured and
    - synthetic inputs

The implementation currently exists as a local three-file patch against
the Ubuntu 7.0.0-38 UVC driver. It adds a device quirk and a separate bulk
payload decoder for this camera.

Before spending time porting and formatting this properly against the
current media tree, I=E2=80=99d like to ask what approach would be preferre=
d
upstream.

Would a narrowly scoped quirk for 0bda:579f be acceptable, or would you
rather see this handled as a generic improvement to UVC bulk payload
parsing?

I can provide the patch, USB capture analysis, validation results and a
version rebased against the current media tree if useful.

Thanks,
L=C3=A9o Vernisse
