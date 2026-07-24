Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7AB36195F;
	Fri, 24 Jul 2026 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887105; cv=none; b=FrQJm/ccE9p6dnFb0kjp+xCw8FHtLCZHLwmZW3KsKfL/i2O+k8Vg4lJnF/kL3iYkokRWWZW3yC0kWmPXOD1FMbvcQKgnVaABeEZItdGOkcvBNRVmMg7lxphlR5FoAtPM1Ulg6oXssOq2nRfreKME5822zZCM8+3JF7iCR1mHj4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887105; c=relaxed/simple;
	bh=jz8LodwR32jdFnOApqEDMEVieSMCREy++cT+5YqMV8I=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=heC+BYBF2w/Y/UvxidNQxyge5r9M1ULMJBBOA79tGLkFnhXVDoEFxm9JaUtxfNayKb2ScgatSUhocSi4/js5m7DQYJ83KhFOubQMNGd5fl4QLg3fa0XZbX6S9M6VwZU5yRDYgSuDDQIFIwcEaUU+q+5Q68pZHvijvWPnwfLNIO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wMNQG5k2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wMNQG5k2"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9ED65524;
	Fri, 24 Jul 2026 11:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784887040;
	bh=jz8LodwR32jdFnOApqEDMEVieSMCREy++cT+5YqMV8I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=wMNQG5k2IIUxSmeIfWocLS4Yb7bzbs06RhNDJ+NkOvcHJWwvXg0sA1Ilxxxetn5Rm
	 8NK4S2Ltau/p3rjK8uvlgqyUEoEV2X6lalVJfuIwYYtdbIplJprQjoJKi2B0lLchAp
	 BGmPj4HAvBc0Nu18HDQsxSPIP21m6XaFdpKPgVEQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PN3P287MB18292491E9351D55A79BDCEE8BCF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io> <20260718200912.16001-17-tarang.raval@siliconsignals.io> <178470050057.3005206.9371104705812276156@freya> <PN3P287MB18292491E9351D55A79BDCEE8BCF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v3 16/17] media: i2c: os05b10: Enable runtime PM autosuspend
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
To: "mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Tarang Raval <tarang.raval@siliconsignals.io>
Date: Fri, 24 Jul 2026 15:28:16 +0530
Message-ID: <178488709608.3335539.13886895288530172941@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Tarang,

Quoting Tarang Raval (2026-07-24 12:32:15)
> Hi Jai,
>=20
> Thanks for the review.
>=20
[...]
> By the way, I'm not sure why, but sashiko isn't reviewing my patches.
> I'm not getting any mail from sashiko on any of my patches from this
> series. Even though I recently sent one patch on int3472, on that
> patch also sashiko had no comments. That's strange :)

Sashiko was enabled on the main list only for a short period of time, now
the reviews are opt-in by joining the media-ci@ list (see Mauro's latest
                                                      announcement [1])

Or you can access it on sashiko.dev:
https://sashiko.dev/#/patchset/20260718200912.16001-1-tarang.raval%40silico=
nsignals.io

[1]: https://lore.kernel.org/linux-media/20260722142757.020b70e1@foz.lan/

>=20
> Best Regards,
> Tarang

Thanks,
    Jai
