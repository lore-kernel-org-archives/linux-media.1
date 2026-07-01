Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78C43AEB2D;
	Wed,  1 Jul 2026 06:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888805; cv=none; b=Rd/yhk2Sr9EMPeyE77IgfDIR8Z58uK1YklG03pBTfWbQUqNDRCbW8smPdCwXB8yzNkAxlVLyvHch6BIxzRqPfVFIDqp5WMCm50//Ux1RaQ9hjoWDiTPcOudRPE0LkYwXXAgTxIPP9X7aa4/xsDxgf0RsHoUSkpmnkyEEB2vdUfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888805; c=relaxed/simple;
	bh=iEAyt3hGrC/IcQubu2WGO1+ewpfyh9SvZ+gYalh2mNk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=kR8O8mTtlFeETLVrJh3k0B3Rh10qYXlU2132wXRVlTAFZO6JJM0dCxwzSngE6j0DCef9D81RX0WuySLHWI9YoZnpkBaseniE+sC54QlFyFrfwcNcxt/EHCCcL46qIIx9PflHYJVi7NYhR/d9DhEkOZnUfCFPXJrARceQwvqPLII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B1nGUBN1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B1nGUBN1"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C01CC1E48;
	Wed,  1 Jul 2026 08:52:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782888751;
	bh=iEAyt3hGrC/IcQubu2WGO1+ewpfyh9SvZ+gYalh2mNk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=B1nGUBN197lQ45bqr/0onPIvMX+/GDNanio1fMNPSxzj/EvT3BfilY5oC8XeMs1QU
	 Ohzuq5Ycww6lpL/6OBv+SyAzVHf1/Do6NdRfuWxFt1ChPjyGgL75zXOG2s2x2kBD98
	 tP5GlfgqESeGcVArApBahzPuLUzih7Cammoi5wfM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACak8wPuBaGCBbBrpoPQ5ftQRtqwijvN_VJoRGs7FzYBGck-iA@mail.gmail.com>
References: <20260625160228.59672-1-tharitt97@gmail.com> <178246824177.1799417.1678746966574660598@freya> <CACak8wPuBaGCBbBrpoPQ5ftQRtqwijvN_VJoRGs7FzYBGck-iA@mail.gmail.com>
Subject: Re: [PATCH] media: imx219: fix test pattern ordering and add patterns
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Wed, 01 Jul 2026 12:23:10 +0530
Message-ID: <178288879026.1799417.14880182647984884282@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Tharit,

Quoting Tharit Tangkijwanichakul (2026-06-26 18:08:20)
> Hi Jai,
>=20
> Thanks for the review
>=20
> > Do you have a strong reason to switch this to the datasheet values?
>=20
> I must say there is no strong reason. I'm totally new here and come from
> the perspective of someone studying how to write a camera sensor driver.
> The datasheet says that writing 0x1 to reg 0x0601 will set the mode to so=
lid
> color test pattern. So it is "natural" to expect that I should set
> test_pattern=3D1 to do so via v4l2-ctl.
>=20
> > I ask because this might break what userspace applications expect
> > (libcamera) and also automated capture tests (that compare md5sums of t=
he
> > test pattern) in vendor board-farms.
>=20
> This was totally oblivious to me when I made the change.
> I agree with you on this point. Breaking userspace does not sound like
> a good idea.
>=20
> I'm open to making a v3 patch and only introduce new test patterns to
> the driver.
>=20

Yes please do so.

Thanks,
    Jai

> Best,
> Tharit
