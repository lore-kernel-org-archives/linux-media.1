Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF37350D7D
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 19:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789327497; cv=none; b=FqvLvtzzVkdUWPwa8xiLgCysAY2/tlAoupq4et2PlewJAuHJ5XQzT3d8dIozhij8Q/SpehzV57t+4arWZnVnrGTI7gvCM+SXTuMtOHRxcpOwBkK76CPbJi/tmkxCvHszWZSOMbXqfX7lgEk77OQlhD6i9ex9CrffhQASXlLaY7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789327497; c=relaxed/simple;
	bh=2E+2Q5rm9LGRQjbRMp2aFWNAPAmbbN5rmj+qwelDs6A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o9QY7V/8CwK+MvqXnyZxTgMxFLdnoViwIxJiMJoqKfNP16kL2qcnsQQDGcs1jx/lIkvhNTmGtVw0JVA62c93X76R6tX+e3eeUA3KaNsOZ6SrEq+4vdIInsNYYR1MVhTPEvljIhlC++UIMIi8Edgoh84biHkCq+QM/xphdkcJ4rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=jKRO2U1+; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="jKRO2U1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789327492; x=1789586692;
	bh=gApuXe9GQXCF6qL5u7BywJoyStRiFYX3/hZCIOI64WY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jKRO2U1+H8niInTjSKP4jP5PYSCPCrWhhZ9yGCPmDHxoJyi5zE8wd4otxl1Z0wdNM
	 qG0tvYDElbSmiG0KBcxdO1amhEgbuvrg/pk0p9bVfxYhvPS77ioiVkK619PgapCGJC
	 Wlt2JuNSE4HkAWEdMzbi4PtPrGh6VkXMEBoC/7XmkgSk1ATZj1yuQCvNZb94ZVi6k6
	 IotjUmCxhZGuu2+W/ipqjI+uJYcloiPnsQ7zkcnDZuGvSLSSopv2FfpVoJgbBhqVaL
	 nmQeQqJPMYo3tlFjaOWWVqqLgeJkoouOAcZjt3G+aUHD1DLVgwSdxWjpDFhhYxyVlP
	 an5CB9eu/5qrw==
Date: Sun, 13 Sep 2026 19:24:47 +0000
To: German Pablo Lindo <germanpapulindez@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org
Subject: Re: More details for Test [PATCH] media: ipu-bridge: the Surface Pro 11 rear sensor is mounted upside down
Message-ID: <20260913192442.53249-1-lsa.uz@pm.me>
In-Reply-To: <20260913185735.6607-1-germanpapulindez@gmail.com>
References: <20260913172332.85174-1-lsa.uz@pm.me> <20260913185735.6607-1-germanpapulindez@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 67fcd3b99b555c74ada4cc702926808a92e416ef
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you. That is the answer, and it settles the question.

You have given me three things today that I could not have got on my own: a
test on a second machine, the cause of the colour error, and now this. I am
grateful for all three, and the last one I had asked for because I could no=
t
test it here.

Your result and my measurement agree, and each explains the other. libcamer=
a
does not rotate the image, and your qcam result is the evidence of that on
0.7.2. I measured the same here on 0.5.0: with the patch loaded I asked for
rot0, and it answered "Camera configuration adjusted" and returned the same
frame, the same way up. The sensor has no flip control, so libcamera tells
the application it cannot do it and hands the picture over unturned.

So qcam is right to show it upside down. qcam uses libcamera directly. And
your idea about pipewire is very likely the answer for the other two:
Snapshot and Firefox receive the frame through pipewire, which reads the
rotation property and applies it.

That is a better outcome for the patch than I expected. The kernel now
reports the mounting truthfully, and the two programs most people use act o=
n
it:

  Gnome Snapshot    correct, in the preview and in the saved file
  Firefox           correct
  qcam              not flipped, which is the expected behaviour

For the patch itself, no change is needed. Its commit message already says
that an application reading the property can rotate and one ignoring it wil=
l
not, and your three programs have now confirmed both halves of that on a
second machine. Your Tested-by applies to it unchanged.

A v2 would only make that paragraph concrete by naming the programs, and I =
do
not think that earns a respin on its own. If a version is needed for any ot=
her
reason, it goes in then and I carry your tag into it by hand. So there is
nothing outstanding from me here.

Sergey

