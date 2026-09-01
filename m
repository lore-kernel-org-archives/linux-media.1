Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E2C368D74
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268686; cv=none; b=ZsQHr0hBKNSE948jHWkJC0oY1WKEu09X+UhvWt8UP7ogEppVb1jnPuMPXiRQC3QvQAJPC6K81ff16cdw8ICbx+xn7TG6g23Wolc9Il5WYDxKGXjs7tbg/WYuTq5dkttlZ910fDTFwmE7TuxeIaEOrMWG+QWOxsEqUQGOma7fen4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268686; c=relaxed/simple;
	bh=nZHhI3ifh7BPd7lm2WaaZGTkNnn3Kto7jY4wG3r7S5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4sPXmzWWMjPpxJ3ShgtSSHLlzdzLGDN2NgLTMmYcjZKifYeJdABfJSIwSVw+SOdFHv7c1Hojp7DjLnxhh8r64alfBhIJA9ZLVfn9eMSA8st3pxrZTxoJX1pwikCMFNzxpsW+OMkaOeeQQFYWMvduQhdfT6wrtOG8sr2Zbpc+k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsvpyS7s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsvpyS7s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E791F00ACF
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 13:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788268685;
	bh=nZHhI3ifh7BPd7lm2WaaZGTkNnn3Kto7jY4wG3r7S5E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KsvpyS7sUHO3asydT1L4uJamE4+QCM06qqlEa4AzqZYv/cGb4Zzn7/d0la/GWStv+
	 w//ELruAb3dZ4kqh3qK9pmssA6lxvx0GksQ/Pd1cv74UHghKqV0piA0v2+qotW193b
	 OaqmHzII9dlAXqJfOWlFog43lNh4z932Lmuuy6hfV+xVTpjMvwl2bJiNy9N/X5EDST
	 HwE2W2SqgF4e3BMzfX+iyzcJ+4rEjtUR66ap/8a3jB7WMMcNZdHAJhyk3b7YZyoYI0
	 4sWnjyUnLyivW71YMwQ/DNw0Ft5KEO/035xt8kTuJ+L6VU6sIic9jGQRGDvjSJmMfq
	 FKh/RKI2e3HQg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b4adcce4b1so5176292e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 06:18:05 -0700 (PDT)
X-Gm-Message-State: AFuF++kfg/jwjwwnp7Yl9Hu1/ijtduOLHLeTL6h7KFWOPJO/6CcLsatL
	xbF6Jb8gL2UKU7UIjwbpokhEFS/S1kqGplXQznuU65SUCrddv7iVo8a0WsZO5OPbn4jzzcZQgLB
	1ryJmmd62CNfJzgc24kA1/lIBYAMbXVw=
X-Received: by 2002:a05:6512:3416:b0:5b4:86ab:5236 with SMTP id
 2adb3069b0e04-5b6041fd0femr961157e87.19.1788268684197; Tue, 01 Sep 2026
 06:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-10-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-10-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 15:17:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLkramYLgD13ssCofjXMw__MTnwELX2=gLgeCoW4Df9YsQ@mail.gmail.com>
X-Gm-Features: AcwNN1Ug7Q_fAjk9ZjkE7RiOtKG9V-_gqcvobjS7F7TexSGYs0sPoHIEpBkqQYE
Message-ID: <CAD++jLkramYLgD13ssCofjXMw__MTnwELX2=gLgeCoW4Df9YsQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/29] media: ds90ub953: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
> the frame descriptor type in the get_frame_desc() callback.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
