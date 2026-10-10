Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88F1353A8E
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642260; cv=none; b=Ayrc5Ztn0PlAg3qVGSOD9j9hbTh4oIWH2Tt3xRGHu7zXRAFI3CqPMPUTLfknh2+XIRgK3luX4F3QDMu8cSGyKP0aSMtcjSx4zLU/zG9rFlsupCC4xMH5jCznLrqLvgNHp4gj0CvdsE/pnkZXni+dKmSknwWIGi/3qhSthssaF2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642260; c=relaxed/simple;
	bh=/cgPU7mRcUDJkjWGH41THm0TabZHRPbimY5e+2a/cmk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fqqUNUbA/jf0d3/RpzkfYUqO7okVxSLO/jGlBRy4sWMFb0Hbms7F4LEDUipCjp8LjVdzZxkVEwG+wjKTxzql6hhJ/pY8i7XU11WfeFFZPBIoywIXkagrWnK5Tm4OP9XlUb0oaF6Zy/T482lPm6/o7YAnJfkAls5Ei0nT3bOaJ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=G2zD8eW6; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="G2zD8eW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791642249; x=1791901449;
	bh=nAidBw7dZjDTWoq7oIK2PkLCjZ1XLRARbiDjSYXsg+M=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=G2zD8eW6wXs1f2spp0w4bDGsZyra4Hq1JThIRcfxsUHx24w1uzyYzbcpQ4BXzTGKI
	 jZFPNCMNoqpk7jjzX4oHsfVwoaaFl5FfnBfCXzZ/mhiHsO57pBSgJk9tkbohseRhLI
	 Ecv0MoHOFvUAW8/Dje2mARACsdW9ln3WdzyPIgCxNB5AE7Kk1CCjSPe3mxgKqb/4Cl
	 joGJ/B/nCFj6De1B3lbbpCPRhO5ZQLvoHryaKGYqbEfpupafvW5jJGofZVtIrY6hPu
	 A7J0nTujAp94dEimHYePOIU0ztEPqSlpDez1dgbeRcgGZzuSTAJf9O/ntUxNfFI46b
	 ixWefTOpE91Ow==
Date: Sat, 10 Oct 2026 14:24:04 +0000
To: Sergey Lebedev <lsa.uz@pm.me>
From: Simon Kruse <simon0x+git@proton.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3] media: i2c: ov13858: add regulator, clock and reset GPIO handling
Message-ID: <20261010142353.23707-1-simon0x+git@proton.me>
Feedback-ID: 50827409:user:proton
X-Pm-Message-ID: 42d3309aa4e6d661005c2373b6222c7676000c0f
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

Tested on a Microsoft Surface Pro 9 (Intel Alder Lake, IPU6, rear sensor
OVTID858) on top of media-committers next at d7e7bca71, where the int3472
POWER1 support and the ipu-bridge OVTID858 entry are already present.

On this machine the INT3472 drives avdd (type 0x0b) and dvdd (type 0x08,
POWER1) plus the reset line; dovdd falls back to a dummy regulator. With
the patch:

- the sensor probes, v4l2-compliance on the subdev: 46/46
- libcamera captures at 30 fps with no CSI-2 errors
- runtime PM: suspended when idle, active while streaming, suspended
  again after the stream stops

Tested-by: Simon Kruse <simon0x+git@proton.me>

Thanks,
Simon

