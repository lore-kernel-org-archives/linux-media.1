Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09853A380F;
	Tue, 28 Jul 2026 06:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221456; cv=none; b=dB19gQFkBWEGqpMNiOaKnwhOR9xn8LR5I5Ld+uDRd8LbmSQT+Dgef3vtMuRlLuT04cwafj6pc2u2vYnSWiubdEeyS2KIOzJzzIphMAlCwK+0NNiFk4M0v4phPIp/BZSYZ5YE8PNaPPO46kCb8qHDGvfq97Y62AYE+AaKgZLwoRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221456; c=relaxed/simple;
	bh=emTXXb/aLlU5fwTIRtTAVfd/jsCpxGxSmDy87dnmizw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=EAhL94SPPIxaWOI0WLKaZgA99DJuNltBR4rUumREwmiGgobxgVPRhdMEZG1kjNTTQ+0IEMd8GEEkCfAaqnCOUiBqu+I8ex4reZFc0ZMiUBG3gJG9AvSN3cbGm/OhguKSnLTZIb8I/9EJFM9+khE9mamOcQVsUw7Usm7Hf/0Xevc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B4Y/CVbJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B4Y/CVbJ"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4944A2F8;
	Tue, 28 Jul 2026 08:49:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785221381;
	bh=emTXXb/aLlU5fwTIRtTAVfd/jsCpxGxSmDy87dnmizw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=B4Y/CVbJPmnF22l9lKqCC2tfZAGcD+5Z9/czRhdB6Q0SftnHOVdqnklpLCHtx825f
	 weLr4tZHw/iBIq/O49Kc5DFns9AzOtJyBugKq6NhZdR3fSXcMG8VRoAGrL95WZfQDP
	 xlWT5y8kehebItWtm109NnnBJaLIZa20vKmyZHek=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <amhMIbajTSSuAcQ_@kekkonen.localdomain>
References: <20260625151756.221096-1-y-abhilashchandra@ti.com> <178429421685.1426769.3663231526402032657@freya> <amhMIbajTSSuAcQ_@kekkonen.localdomain>
Subject: Re: [PATCH 0/2] Support RAW12 bayer formats
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, jai.luthra@linux.dev, mchehab@kernel.org, mripard@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, r-donadkar@ti.com, devarsht@ti.com, u-kumar1@ti.com
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Tue, 28 Jul 2026 12:20:40 +0530
Message-ID: <178522144079.4139729.4172706447226166553@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Sakari,

Quoting Sakari Ailus (2026-07-28 11:58:49)
> Hi Jai,
>=20
> On Fri, Jul 17, 2026 at 06:46:56PM +0530, Jai Luthra wrote:
> > Hi Abhilash,
> >=20
> > Quoting Yemike Abhilash Chandra (2026-06-25 20:47:54)
> > > Hi,
> > >=20
> > > This small series adds support for RAW12 bayer formats in the j721e-c=
si2rx
> > > and cdns-csi2rx.
> > >=20
> > > Testing details: Tested on j722s-evm with v3link + IMX390 downstream =
driver
> > > Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/805ec4662b=
60ad925e979d55a9515f89
> > > Testing Branch: https://github.com/Yemike-Abhilash-Chandra/linux/tree=
/RAW12
> > >=20
> > > Jai Luthra (2):
> > >   media: ti: j721e-csi2rx: Support RAW12 bayer formats
> > >   media: cadence: csi2rx: Support RAW12 bayer formats
> > >=20
> >=20
> > Thanks for the posting these, LGTM.
> >=20
> > Sakari,=20
> >     could you please apply this if it looks good to you too?
>=20
> Is that an A-b: or R-b:? :-)
>=20

Ah I wasn't sure if those tags could apply given I was the original author
of these. But if one is necessary you can add:

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai

> --=20
> Sakari Ailus
