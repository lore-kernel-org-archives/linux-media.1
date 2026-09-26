Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB003515F7
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442224; cv=none; b=AS7ykyQzL5a6DZ7BJRxcdD/SfCvXiH7JpoFQ22QfECGNEWpbrevh7ksPAwL9vZ27OpfLOAYLCdRf4quI+fWc20iC6l7t1JzJubvtsTzv+ubD6w5o5NS2MkZmh08JR89uMPgNU7egMc20uiPk5zLWZhAOq889C3Jx7ZM21LafH88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442224; c=relaxed/simple;
	bh=aoUcH8q6R4+eyNaifFoH2Aor4f8mjT4hXKCOfkY4BSc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NxtCT+rZA4PzB9TJwwZpVduiK5wGxs6aPsEhetD2yfPGVFgulVxXuTwXi2pyygWQjE7nuM41waVn11SzliIorZIIabHENzRLPe0++BxhM6qqczjWnThyCOM1k6oSaQpzt0utqGtuKpzJnCVvX4fL4Clcl/ZytZ5UcZj6QejPMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=a2EG3wDb; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="a2EG3wDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790442219; x=1790701419;
	bh=qRKBBHzxeQEyTEnSiATT4uABiyIjz34v74Z/J4pJSPU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=a2EG3wDbE9/OUkViBeHIr0LOf1PFP7Lc5MMFLPbfIl01u6pODfVyzB9Nd6LRjCB3K
	 xcuoKq2U0bO/JGx8fOK1rSBE/PtyJiYplHAx+ljfRfj/57RP2Tv3bD4u8dsB8YXNwE
	 r2sTKmeWzFOPEu6LoAv4hfqSg4QJ8+GIyty94AEq4jzda60UreOPQla8DALNeJsHn1
	 FFDqrTJk3OS7cRpaVDTaxzY0VvKc6y5QfecgHodJkHxq4hpwDKj88NTXN7nVYFWRVI
	 bkNydKl1FbO/pnGgUjlWLUQSRyGIVcIelvR+/vdviuuFQIILeCGlEvw6XwBQCyQPNW
	 Ln9vCnwYB4TWg==
Date: Sat, 26 Sep 2026 17:03:35 +0000
To: German Pablo Lindo <germanpapulindez@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Test for [PATCH v7 0/3] Add support for the Sony IMX681 camera sensor
Message-ID: <20260926170327.60895-1-lsa.uz@pm.me>
In-Reply-To: <20260926092828.11675-1-germanpapulindez@gmail.com>
References: <20260923211816.89954-1-lsa.uz@pm.me> <20260926092828.11675-1-germanpapulindez@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 9196d4447cd0c8e3597aa7400bc62f11c2160366
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

German,

Thank you - for building v7 on 7.3-rc4 with the two-line change, for
putting it through qcam, Firefox and Snapshot on the CPU and the GPU,
and for the Tested-by.

I rebuilt libcamera 0.7.2, your version, with its stock tuning, and
checked your three points on it.

1. The slow start is real, and it is two things. Since v6 the driver
   starts at the minimum exposure, four lines, as Sakari asked in review,
   and 0.7.2's AGC climbs from there in small steps: 0.7 ms after 6 s,
   17 ms after 13.5 s, and on the GPU the picture stays grey for about
   the first ten seconds. And libcamera has no helper for this sensor, so
   it takes the gain code for the gain - a code of 17 is 1.02x on this
   sensor, not 17x. I sent libcamera a helper on 31 August, which also
   gives it the black level; it has not been reviewed yet:
   https://patchwork.libcamera.org/patch/28155/

2. The mirroring is the reverse of what you saw on v3 on the 10th, when
   Snapshot was the odd one out, and it is the driver that changed. Up to
   v5 it mirrored every frame in its register list; since v6 it delivers
   the image as the lens forms it and leaves mirroring to HFLIP and
   VFLIP. Whether a front camera's preview is shown mirrored is then up
   to the application, and the three you tried decide differently.

3. The lines are there on 0.7.2, on both cameras, and only on the GPU
   path: the front camera's GPU output carries blue and yellow stripes
   about 25 pixels apart across the whole frame, the rear camera's blue
   lines at fixed rows (311 and 791 of 1920x1080). The CPU path shows
   none of it, on either camera, same scenes. The pattern is fixed in
   the frame, so anything moving across it shows it. It is libcamera's
   GPU debayer, not the drivers - its issue #351:
   https://gitlab.freedesktop.org/camera/libcamera/-/issues/351

   The shader fix proposed in that issue removes both here. Measured on
   0.7.2 with and without it, same scene: the stripes and the fixed rows
   are gone and the GPU output is as clean as the CPU's; only the
   frame's first rows stay off. It is a one-file patch against 0.7.2,
   linked from the issue - if you can rebuild libcamera, it would be
   good to know whether it clears the lines on your machine as well.

   You saw them on the CPU as well. Snapshot, and Firefox through the
   camera portal, run libcamera inside PipeWire, which does not see
   LIBCAMERA_SOFTISP_MODE set in a shell - could that test have run on
   the GPU? qcam started with the variable set is certain to be the CPU.

Sergey

