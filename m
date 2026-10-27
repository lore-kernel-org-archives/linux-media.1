Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096808;
	b=W+AFBlpxjNXj2yM9rnzUNXUv4Yt+tsRBI5dgulKM3QrJM599zIK7mOgFNq6xoThsdKEn
	 UPQsgF3k3O85U9bEdami7qoCrUBVYYsDtKEkHkRwQQ/GWCIT7Dc0EncUonv9aDWYv6891
	 kF9u8DuLm0vvoa3JDwj8VwGzkWqjSSUjZfSI0q68OASsuKGq+vsMfrER/mqGP2NDZEx2I
	 Ph0OdbKBJadOHmxkfTtcw8xPJyOraMr401mnw5BzSLqSlh/W89zJCcZw36vhkIzNmZEDe
	 +EFK0zdjybARRo7l07/5TAdj1LiNOvA6lacRx40LmQ4uDXQ30q/4xMHqr1LW8r/SS4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096808;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=POzvAe7QGGr/0bL2el8rav1+Sb6N+ML+fOUxzpGMHxk=;
	b=oB1aPdNvm8ebK7fqu6AQVr0HNA+5kcxble2aZQ/HzYRi60Aivglkjx7O3vRFQp0PBnOW
	 oJAxMHT5ty3v5wS8A0g1z2JBNZz28UI44sHzjiL9f5IeOfl0w1kVJ0G1NX4FE4BWh1pej
	 0ooJHR0Ti8Y0eQE6p2o3LmlaDwa+0jhMqC47mEQD+zUla0f6MlLx9SHfrUTmhSAjoqIKE
	 0zM23aJCuALDQbeJkBWTND13IjBH9ciWCLJRJpTk10+PHt01mJLV0ynvVIjryzsmpnVSP
	 x1dNi5j+oBDqDUxI5aWVHpYSiSrdTd6llwvG1JhZmTiGyuf5/ka2zQp8r7DtEoDOONQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB37D606A33D
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 10:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB37D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so21683165e9.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 03:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096806; x=1793701606;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POzvAe7QGGr/0bL2el8rav1+Sb6N+ML+fOUxzpGMHxk=;
        b=Z/xfU6CTw1r/5me5P97MRXb+us66jRqAo3ekkMptPdQrQm6nJznLad/QTh7wmfx2Y5
         9H/tBkNf/Ett1mj5VG3H2NSiJs0F/nqCpORdhwH3JTqNjM5qxeYFWq2UJgHRS7hkjM/P
         /fkF9RjyInhrggN7Ikd9VKyg3coqFqarGa60lYhJZUGrKJw4WaADDlH4x+kQ1uzVlpQo
         7Ti8QW2JPvDCj6+yqtQo9FVH2I6Yc836QrgM1621fe404mCcApZtO/FrQ8Skb875sJYi
         2pFCFqL9xmGRfR8SjKo8QTi4JzU/Z4O/R7KJ60T2TrJO+HVrcLwE2W6DE4GWE9PApphn
         Tvew==
X-Forwarded-Encrypted: i=1; AKwUvBx17b3wUEUJJvcdQpmGNrJtoLnA9WetiIBWaVKzb4XQQ2/xqscr/cHEg/YPdG234DZz4259OUCtF/4I6A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJzPyJK37q7veyJlnG4t8uet0ybG1Fb+EH7zjEAx8FFMKDiD5Gh
	4B+De+dxwqvfTbRXJOKy6bbd8eJsxnidHi1ZMNqwRLa/ArhGifoKHgeHEMjnSaVrMg==
X-Gm-Gg: AYBFou3LdIw0YxvDqutOTqo7tWQ7cumKI+50HSS6jHf4ZtoaeW46j1hiMPN3o3YV4v2
	iGCkTafxAawF0WIM5had1F1J7X8C4QaLP3ojF9XnvgB745xqd/0g5IAEw3TznM9OJpwZp259QUI
	8WhvxWp4ses7eIOnPLNuuXM2bPHQ6tn/EVsNPI6L0x/EaoDG/uyGlTaOKYR8u/W0G+vG9EPj7yJ
	UhP6+oybp3qI2ykdTZny1EDQoO7oZIlDxIxlx033NueLb9HCqCQxEOihfuXWnq5Db8h/kd7i3Eo
	zDdVVB51SiM/8n3wC8T8f31zlQPJeIoQBlVrGx1bAOTsvLOHjRv37xn7zFS8APxtjNJeRXurZ3G
	s06y5AzhPNIkm34A9ChemqmP2YoPjhBuoJjBoonf9QWzQo9lyG1iPh0N88U3fu25txPf9Wckf+0
	IF+7vvErrURj6Jki26D9D/aNHpKaF7kRB/s3Gmuf49rnYNevK5t/Cy6sb7tHpegloe1d7cTOHjL
	9JKCNhKd34pg9ej63UA63jiSXHlV/XAZcLhVsmQ95SgyADbe/4UIvfl2UJS9r/cUqFlrWWH+Co5
	7AAJk+QJjbSQ68IKxN2fPX030blpBQbUWBhxJU4=
X-Received: by 2002:a05:600c:34c9:b0:4a2:994:575c with SMTP id 5b1f17b1804b1-4a35acb994bmr179703845e9.34.1793096805704;
        Tue, 27 Oct 2026 03:26:45 -0700 (PDT)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f3e00asm444137735e9.0.2026.10.27.03.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:26:45 -0700 (PDT)
Message-ID: <6ae07c65.e52dcaf0.293af3.e7d5@mx.google.com>
Date: Tue, 27 Oct 2026 03:26:45 -0700 (PDT)
From: D. Manresa <dmanresa@gmail.com>
To: antoine.pichot@gmail.com, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, djrscally@gmail.com,
 dan.scally@ideasonboard.com, hansg@kernel.org,
 andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/7] media: i2c: ov7251: Fix link frequency index
In-Reply-To: <20261026111032.88355-2-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
 <20261026111032.88355-2-antoine.pichot@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Oct 26, 2026 at 08:10:26PM +0900, Antoine Pichot wrote:
> Observed on a Surface Book 2, where ipu-bridge lists one link frequency,
> 319.2 MHz, which is link_freq[1]: V4L2_CID_LINK_FREQ reads 240000000,
> and the pixel rate and PLL registers are off the same way.

The diagnosis holds on a Surface Pro 7+ (IPU6 Tiger Lake, 8086:9a19).
ipu-bridge gives this machine the same single frequency as yours:

  IPU_SENSOR_CONFIG("INT347E", 1, 319200000)

and unpatched, the sensor reports

  link_frequency ... value=0 (240000000)
  pixel_rate ... value=48000000

exactly the mismatch you describe.

Applying the patch makes this machine worse, though, and since it carries
Cc: stable I think that is worth resolving before it goes in.

The fix does not only correct a reported value: it reprograms the PLL and
moves the link from 480 to 638.4 Mbps.

                     unpatched v6.19     + this patch
  link_frequency     0 (240000000)       1 (319200000)
  pixel_rate         48000000            63840000
  PLL1 0x30b1/b3/b4  0x01 / 0x4b / 0x03  0x04 / 0x85 / 0x01

The IPU6 receiver here does not hold that link. 150-frame captures of the
640x480 30 fps mode, counting dropped buffers from v4l2-ctl and csi2-5
error lines from dmesg (including the "callbacks suppressed" lines):

  unpatched  run 1  dropped 23   csi2 errors ~7216
  unpatched  run 2  dropped 23   csi2 errors 13277
  unpatched  run 3  dropped 13   csi2 errors 4722
  patched    run 1  dropped 106  csi2 errors 120788
  patched    run 3  stalled: 50 frames, then none for 60 s

The errors are DPHY fatal error, SOT sync error, inter-frame short/long
packet discarded and frame sync error. The frames that do arrive look
normal, so this is the link and not the image.

Two things to be honest about. This unit is not a clean baseline: even
unpatched, mainline already logs thousands of CSI-2 errors per run at
30 fps, and the out-of-tree Surface driver sidesteps the whole area with
a vts_boost parameter -- at its production VTS of 3448, 15 fps, I measure
zero CSI-2 errors. And the sample is small: three runs each, one unit.
What makes me report it anyway is that the one-line difference was
consistent in every run, that it introduced hard stalls I never saw
unpatched, and that going back to a build with only that line reverted
gave 568 consecutive frames with zero CSI-2 errors.

One hypothesis tried and failed, so you do not repeat it: the out-of-tree
Surface driver notes that the vendor runs the 319.2 MHz PLL with the MIPI
divider at 0x01 rather than 0x05. Building this patch with mipi_div
changed to 0x01 in the 19_2_mhz_319_2_mhz entry was worse, not better --
3 frames in about four minutes. So the divider alone is not the missing
piece. The vendor path also uses VTS 522, which I did not try.

So either ipu-bridge's advertised link frequency is wrong for this SKU,
or mainline's 319.2 MHz PLL entry needs more than the index fix to be
usable. I have the machine for a few more days and can run whatever would
help decide which.

The rest of the series tests well here; I have replied to the cover letter
with that.

D. Manresa

(Written with AI assistance, directed and reviewed by me.)
