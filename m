Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610906;
	b=hCl8tQRrhUNdoUe3RFD0dDy9eeOHjR2WbnYZGFWaslpg/HVjMvyB67AvjoazoBl3zZV0
	 aueYCzVYq0adp5/52YWO8i2xTy2RgH34JRU9XOMdc4pwpfHjFK5ijED5GE5q25HMp8Pl0
	 qUSOOTiwEq6ZLGBD6EM6kDhTsmoi1DuSU4e8eq8llVHCBlAVkR1SDJTyXkLx7ukHZbtGN
	 uEboa4erCz1FmHRcRjA1arwcTVbbOyVmsjCfU/jFHcFiIemfmof4UC3MT9unTk+Kun8zs
	 i3Qb2ej4mACpbKvxkE0qc7rKHH88TEeQ56vC2pu3yZ+z4vT5PYHULne6EmUN6P7ddBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610906;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=yGe3xncwVvBM3DMcz4ZLzEYgEuLiYC/Xkwy5B+hy6yI=;
	b=MkNihi9T3xGwxunrva9TuplRDe9i3hvA7n3H2yWFZnmY6p6XlIXU5UA0EXUegdCMs/Jn
	 3/zAgschYCr6vveHoiwU+3bUbMOlI9TJH6+daT76w3GVF8duJVS5bfzbgxd5aBMP7yoOn
	 7L5GBV7W8iP2B1cGy/h76sUSVGy+khTvL9SPRmfJ3ql5hbf2Xsin+N34diXduAw8mZAP3
	 b1d3h735y9HH6vkGLlWvzaOya9CZOKqfRGAz+TKsSTTNSqVwkhvLyFgcvV5nOycOHiO9q
	 vFz+k2MQTkNeQNuY6KgKVUAqCFgfmXEuqx7oJWOk4Ab0qnZN1G4w/o75Ktq5Gu+1DIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1OC2JA+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A18560A260A
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1OC2JA+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FC71F00A16
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793610906;
	bh=yGe3xncwVvBM3DMcz4ZLzEYgEuLiYC/Xkwy5B+hy6yI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O1OC2JA+3GBqiVHCO9uqUVgGPibVB326fR4juOEAuLRc/pPL9iMwR29JW2/OikRqE
	 0ahx7XEc++TCk2WbClghzoKAGyBVasfIea6gropc0/WcBA0d0TxbiiOmGES0XK472r
	 sN3Qnq6fXiAyGjM/Vyhf39R1l7ngyEJrS4lZZR/XbDSDipo56dm2hdDmW27iEIgTEE
	 876nZwpkjQqhXfNk/qD2oAkaSrZc7f6fhc22qHSCvxTrvWB72YKO36oBZoMjKtqKBK
	 GtnjMbGrhi24ftqUPnihzBtB3ToZfFZXxgr6HTnxOJmCIFem9JmiTr9fi+3BJSG3nB
	 a5jwULN19Zz5g==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso2607076e87.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 01:15:06 -0800 (PST)
X-Gm-Message-State: APuU4Z/q98p1+Dd6Hbrf6y/C6Vn3SdNrNVM9XtP4SmQ3DutXSgrFmkA2
	L4P+yxKHas2qe7DkSHKDvGqxa7uanZ/PcNEdkEQgCWyfseNI86/S1xOgo9ObakeqcsnqcgQSVyP
	4RHNuvOUD48XwjUFeEjFq7dPeY9ccTHw=
X-Received: by 2002:a05:6512:2203:b0:5bf:ce24:242d with SMTP id
 2adb3069b0e04-5bfd956d5e8mr2899135e87.35.1793610904944; Mon, 02 Nov 2026
 01:15:04 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Nov 2026 10:14:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLkj_3HNY-k5gJZjYX82KWgmk1_EDCQqHcozWynkjTLCeg@mail.gmail.com>
X-Gm-Features: AclHuK9itLKPgsvEZWAAclVdvwOIV9mrdzm0NUtfGqqYXvSn5X944gtQXMXLScI
Message-ID: <CAD++jLkj_3HNY-k5gJZjYX82KWgmk1_EDCQqHcozWynkjTLCeg@mail.gmail.com>
Subject: Re: [PATCH v3 00/29] Rework frame descriptors
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> This smallish set makes frame descriptors dynamically allocated and
> implements a single-entry frame descriptor based on the device's format,
> using a new helper called v4l2_subdev_get_frame_desc().

The smallish set has grown ;)

Do you think you could rebase this for v7.4-rc1 and post soon, I think
with the fixes you reported it should be ripe for merge by now, so
I'm eager to review and ACK the stuff.

There will be bugs but I think they are best resolved in the -rc phase
where people can test it in linux-next on hardware.

Linus
