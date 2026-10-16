Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C764AB1AB
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155683; cv=none; b=f3bvkf5IyXxOnA+8epf4dqG/pQ2yi/i+92w/luyg/BnF2TG8aQPtIVAcUpt0Kap7t4CaWQ+8iQ25G8tQPMP27KWf+tsEc/uyunj+sRXWF4+E/G/8DRJ8n/C045Y/WxqwMpHoCYhtK6qxsIYyyXfi2B7qefW0hKtKLR4uP7DskbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155683; c=relaxed/simple;
	bh=ZOtxt04blQ/fJ7m9OF8IBcmwE+sApzcJ9EJu/rX3BBc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KbDu4LIGC5r6E1KEvVDqNvlG9XRkODrRBPANY8cJmwQeq/6XXBQIXj7oeq5TkQ4Cwge2tC81VRUpcfh/jiro7lr8H+Krb5pZ1X5yvrangFlwyDSB7hE0D7zUte6+IQUyynkXM2pu2tESuRoMLNDmsvkA6Tx3nRZ5Wq/xryq8maE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Jc4yCvhY; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Jc4yCvhY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792155672; x=1792414872;
	bh=ZOtxt04blQ/fJ7m9OF8IBcmwE+sApzcJ9EJu/rX3BBc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Jc4yCvhYR6BEjQ1thCUaVzU9YdOag3/bBAqm4RuB8pVyT0jQz0Ie8jziHy7E63yY2
	 zpoeFjXS9ovz+ZTv8gZ7cx/jrlPEZDWCzOXVVy5+tbGH7SnG4RXnYcENix3Wtex+/r
	 SteLvToVlTfVyLnHS1nkqkhRDRtQbfynbb/Hx+hOOxly2VDnZkvhXvCQ9p94/GiC0z
	 eJBksoNgXALLeU+UT1Z1v9RnLFb5vlAtwdC/Vcjz2EP17DNkHuSTj0AC/Y2BZD9cuO
	 scOeGrn1Yp6xPYA+umGkEUsLVpxUEWm5NeBaiL19tkPi6doX17NBQKkzFh1e6PHXGN
	 CVo9cYWNwnzDQ==
Date: Fri, 16 Oct 2026 13:00:56 +0000
To: George Neacsu <geocausa@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov13858: Set the colorspace in the pad format
Message-ID: <20261016130044.43798-1-lsa.uz@pm.me>
In-Reply-To: <20261016-ov13858-colorspace-v1-1-51f0379ada0c@gmail.com>
References: <20261016-ov13858-colorspace-v1-1-51f0379ada0c@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: c277909113d9c1adcb2fc982cccd494573d5c43f
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi George,

Tested on the Intel model, where it failed: media next with my power-on
v3, without and with this patch. Without it, Active VIDIOC_SUBDEV_S_FMT
fails through the media device on fmt.colorspace =3D=3D ~0U, 53 of 54. With
it the pad reports Raw, 601, full range and no transfer function,
v4l2-compliance passes 46 of 46 on the subdev and 54 of 54 through the
media device, and the sensor streams 4224x3136 at 29.95 fps.

Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11 (Intel)

Thank you for writing it up.

Sergey

