Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8657D386571
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 04:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783139805; cv=none; b=nNOrJ+33pjmzOU0fo0A83EUWzO+0Gjmgeew746kmLLwKh7yZIdKtfTh8M77Q6pE0nIf4UpV29IqDR3Co5E2anhOeiKhYiARQmMW5gcfm0ltes2htdBFuOTu2/UeujgJADY5hHrRyeumrnjZliGE4Yh0ZybNFa8mDwp0/5zMhIS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783139805; c=relaxed/simple;
	bh=jVPt16f3fCOIpCJExzAuHIVzHfwoIsSFGogfasDmczM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=DE+0kjFs/yyaCdj6NiJIqx7gLKXVZTTXTqU2o0xzDYtmyiDjzRddgyo0ESltjij8wcQOA9dfBuRgAxG8qHDTO//OizDSvThXfgKBKyvYBHftn9e7DHjYw5PRu3VHtlyD9BB80MHx3THVi2z02yJfHK82Lb5gVVK3i53np+IGqIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oyDreyBI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oyDreyBI"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 359623A2;
	Sat,  4 Jul 2026 06:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783139748;
	bh=jVPt16f3fCOIpCJExzAuHIVzHfwoIsSFGogfasDmczM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oyDreyBIhFQ/EwDN6/XadS6bYRduac1H+P7HX5sUOZKBVeOg+AdjUGHJ2oyyFPNLb
	 oLXzxh6OC9s+EKVfOIeHRpw1n9XF5WqObxx/RBCLfjIqiYtdT11Iq/r2SUwIptLkX4
	 RTAj8GgzPSnX0Ix2EI7Zqx6pfwBCs9tgo8qBvKdc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <akgoiXheHnjrDtqW@kekkonen.localdomain>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com> <2dd5cef71eb1ce5c246e64105ebd0d5cd593a0e0.camel@ndufresne.ca> <akgoiXheHnjrDtqW@kekkonen.localdomain>
Subject: Re: [PATCH 00/41] media: ipu6: Add support for ipu7 hardware
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org, mchehab@kernel.org, daxing.li@intel.com, ong.hock.yu@intel.com
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 04 Jul 2026 05:36:31 +0100
Message-ID: <178313979158.459445.3804729958099737941@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Sakari Ailus (2026-07-03 22:24:25)
> Hi Nicolas,
>=20
> On Fri, Jul 03, 2026 at 12:17:17PM -0400, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le vendredi 03 juillet 2026 =EF=BF=BD 18:24 +0300, Antti Laakso a =EF=
=BF=BDcrit=EF=BF=BD:
> > > Hello,
> > >=20
> > > The 7th Gen Intel Imaging Processing Unit is a PCI device including
> > > input system and processing system. This set adds support for ISYS
> > > in IPU7.
> > >=20
> > > At this point only IPU7 is supported, not 7.5.
> >=20
> > Is this implementation replacing the staging driver in
> > ./drivers/staging/media/ipu7 ? Can you outline the plan ? Compare this
>=20
> That's correct: there's no longer need for the staging driver once the ip=
u6
> driver has support for both IPU7 and IPU7.5.

Only out of curiousity, but if this is generalising IPU6 to support 7
and 7.5, is there a chance this could help IPU4 users which I understand
is also firmware based?

--
Kieran



>=20
> > implementation against the other one ? Or perhaps its just a different =
component
> > of the camera?
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus
