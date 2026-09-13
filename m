Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9826C31B80D
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 19:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326342; cv=none; b=kTCUCx4cfF7ZAjLkKGsEimLBuUOyU6IXEraDPkVviHR8Ei91Bd7Gg2T5AtHMEZZYMiLQ4T14EyRLfpUC9omH1H3Ysm6nQEjwg0VO+ofdFS04AV85uFket812uZJdjr3weudQEhhjFn1mebkG09iApquIShYOCnp7wPNRPg4kYE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326342; c=relaxed/simple;
	bh=YdPNDLkF9g56cRKHrsyJu7Ojgg8mMv6rqh0+BRg3j7A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PAYtART2Kg5IfvC2HJZNBVIz7eziA3iR5kPNFp3ytvaBVVj5+9YPWl2RJo4l75tH9gTZydYKgtixhOZo0cS/d/0fnwrf4/s7TNA03VqMieQtoSliVDUJKdX2hNaJvLS+0w1Vy1hRVMqLY0Op5RttolklNzbWrFUq2NbqLnWTRKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=HGrsFgX3; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="HGrsFgX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789326330; x=1789585530;
	bh=7QHfqMH0nuMBhYolPNtiRkaj/ppc8vL2iIlxnmPXQ4I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HGrsFgX3zYxfwhohzrHPl6sXsBPd7Hx1xiJzJ61TDmZ2uKMGGcH836zPYU+0mjAwm
	 NNe1sM4cg8rVXk5Zk/dqVGBMm2N3eZl9mglv58m/nO/FacGbZKujNXBoLXErwn9EvD
	 cTVaxHOqW32m8ycjVuVA0FyTknmE6FAG57ApIFcWU0rOXoyV/5g/psf5DiVMmfm0Ye
	 vopco887Wb6wJoHdHrxS0rvLrARTngqL8OjzK65HkDorFQyQQFGM0pGmc6FLfNQ546
	 vFtjSJcwVfyCPcB8nNL28my8i89U/o9079zuP/BBeTBPYZTf9AxZ6NfKOFwZPhOayP
	 J6IWPb1AUKZSg==
Date: Sun, 13 Sep 2026 19:05:25 +0000
To: German Pablo Lindo <germanpapulindez@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: =?utf-8?Q?Andr=C3=A9_Gilerson?= <andre.gilerson@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hansg@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org
Subject: Re: Reply cause of the image error in Gnome Snapshot [PATCH v3 0/3] media: Add support for the Sony IMX681
Message-ID: <20260913190520.31357-1-lsa.uz@pm.me>
In-Reply-To: <20260913181806.8626-1-germanpapulindez@gmail.com>
References: <20260913082400.29504-1-lsa.uz@pm.me> <20260913181806.8626-1-germanpapulindez@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: b656bcbe590eeb999ae91316afc7b9ae50fc9671
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Short, because the detail belongs on another list.

The colour errors and the lines German reported are not in the sensor
drivers. His control shows it: the same pipeline renders correctly when the
software ISP is forced onto the CPU.

  LIBCAMERA_SOFTISP_MODE=3Dcpu qcam --stream "width=3D1920,height=3D1080"

Same kernel, same driver, same sensor, same resolution. Only the debayer
implementation changes.

It is a GPU debayer problem in libcamera, and it turns on the input stride
being larger than the width. I measured that side here. The IPU7 ISYS video
node rounds width up to a multiple of 32 pixels - fourteen widths, no
exceptions - and German's IMX681 figure reproduces exactly: width 3844 give=
s
a stride of 7744 bytes, which is 3872 pixels.

That padding is the ISYS node's. A sensor subdev has no bytesperline to set=
.
It is also ordinary V4L2: a driver may pad, and a consumer must use the
bytesperline it is handed.

So nothing in this thread asks for a change to the IMX681 series. I am
sending German the rest separately - the upstream patch this matches, what
the v0.7.2 source actually does, and where I would look next - so that it c=
an
go to libcamera-devel, where it belongs and where I do not want to drag thi=
s
thread.

Sergey

