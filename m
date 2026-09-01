Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F182D063E
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297769; cv=none; b=miNbiL9fZySQobNX2FwYmCIOhFKPEFJoGr2ja8zv3BHz9kbS4DxJDGt1nK/u5d0/Y05cy7iLdjqgKjrQo4fiMHK0BTzT2c1ADz8FMhmrApRBTwCeyfbTUXe5+E3iA2fTZx5HpmUJ6S5jPYJSQ0bxt7W8bweqleA9q4GgYKmtPPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297769; c=relaxed/simple;
	bh=nZHhI3ifh7BPd7lm2WaaZGTkNnn3Kto7jY4wG3r7S5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIMG96D71+0OxXDAL2+Yyibjfk3Xl7nnQfPPK66i/s1cQ+EkGFxAlE2+PoJJNTn55xbHWyPoa0xdI8XMr3medy3vkp84j+H6kxe21glSHB+jxwGlKlvRF7URKYTs4pl8pqm64n827BbusS8I0WPhb3hKmt/OzkgQ5dkcQT9nIsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUq673UO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUq673UO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87D91F00A3A
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 21:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788297767;
	bh=nZHhI3ifh7BPd7lm2WaaZGTkNnn3Kto7jY4wG3r7S5E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eUq673UOE/q27SY9kXp5gF51Jx4WRoRW6USDYJwu9K8fELCFV9D5tQXqSShdHgaYi
	 oB6CX9nHFlcxGRl4HeQztd0cln64J7Q5S2bLFYAzAImCcVcfeeU3nPy4cWgQlJ3s50
	 rEJAnJvt/OOwf2SWZKh7xZExRZsLr7lQymeFJP1w9WCkYEpxBMQKfLTY7hoG/hrjMi
	 kkM6aChV8vWbAQjAB8kjfwnKQKRLfz7wtBd5O64xLC7pxTRyUQ8dGX5PHLFtmb6GBX
	 OKvA0c8KrXUKM86+yFcUZH3BTaKmhjHMRL4rjqh7PCVUaMfh5AvFNxxmuyUeuYT4qS
	 ozjY1c7EjbHNQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b01910b499so280380e87.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 14:22:47 -0700 (PDT)
X-Gm-Message-State: AFuF++mDp4RWIk0IHdFKDJyP5VPDze44vU+466FyaqQBXkxDFqfjggMd
	T5t69GbdJpS2MXR3C2MPQz5DmY+l8jdcMLbpii48YlRApqB7OoQYeyX6nGSijRb7un7g6dTesgn
	jM5/A5oJPjJyEVB859gid64xQQJDF3E0=
X-Received: by 2002:a05:6512:3092:b0:5aa:62df:cd0f with SMTP id
 2adb3069b0e04-5b604271817mr1685541e87.2.1788297766323; Tue, 01 Sep 2026
 14:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-13-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-13-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 23:22:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLk8bWxph6xtk0nf=cnb9K2R+WtinV7derPgCGaPyVEMFg@mail.gmail.com>
X-Gm-Features: AcwNN1U_p0ZMBl2e0pg425U8RQci5hikJ7bMN4t2JhfTP55Q9HwZsRNddeaxUOo
Message-ID: <CAD++jLk8bWxph6xtk0nf=cnb9K2R+WtinV7derPgCGaPyVEMFg@mail.gmail.com>
Subject: Re: [PATCH v3 12/29] media: dw-mipi-csi2rx: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
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
