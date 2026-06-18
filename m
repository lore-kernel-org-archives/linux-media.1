Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23557083C;
	Thu, 18 Jun 2026 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781794670; cv=none; b=kc0TNuq3qXigHyvTIbggbgbckbP9ISKSfdrFvtk7ZJW5PLXHdX4bxRh7dVbQu0IpXpG474zR9nGJIjWUN2lBSlJ45+Aoi0qdnHOeekXR5IugnBeXXA7C/f6hnNaVdfkmbTClXJ1FI7+djyHVCdLaidBNO6WYTOmOmYefIyLpY3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781794670; c=relaxed/simple;
	bh=U0PZUbyiQBMArrRR3Faq23INEhjgIx4zmwD0VrrClQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QI6mKqhhKOoJ6kJvBKzDudTpCs3lSXlEDqM5bQYMcR9XL+z/QTrXAG8+w4oomVQa8Gr3sF6axQLJUGirYMZa+zx+wHEbUxayStVmFtD1XgQ49RDhIDlO1EQI9xliLAI/mcrMvkeElxtlc+G4AthM2Ra9tJQlithV6DDbt7HUjjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=spK4j1+h; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="spK4j1+h"
Received: from ideasonboard.com (mob-109-113-4-199.net.vodafone.it [109.113.4.199])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1644741;
	Thu, 18 Jun 2026 16:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781794631;
	bh=U0PZUbyiQBMArrRR3Faq23INEhjgIx4zmwD0VrrClQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spK4j1+hE2HdBSJmjliKOe/M4+BtkHlS/eT+8ON6b1JO+/iJpgZ5wUSX8sYyjdlcj
	 Y5YcuSdp9JeJ41C/8/b+BjFAtSmUVz6X/czImIG5qsGi2PouPplb8rLfLvpJP0y5Lb
	 QWGDRfOkPnSSOkmgeVqOihyS26SgJCbHWqNo5u+I=
Date: Thu, 18 Jun 2026 16:57:43 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com, 
	Konstantin Babin <Konstantin.Babin@arm.com>, Anthony McGivern <anthony.mcgivern@arm.com>, 
	vincenzo.frascino@arm.com, linus.walleij@arm.com, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] media: mali-c55: Add support for CCM and Gamma
Message-ID: <ajQG0BTLxiJ7PKIh@zed>
References: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com>
 <CAD++jL=F4HtrT0kL_9KNS1A7hXsyMc9jAgnFv0_rxbcfxBEjOg@mail.gmail.com>
 <20260618-gifted-dazzling-kittiwake-8dde2b@meerkat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-gifted-dazzling-kittiwake-8dde2b@meerkat>

Hi Konstantin

On Thu, Jun 18, 2026 at 10:48:39AM -0400, Konstantin Ryabitsev wrote:
> On Thu, Jun 18, 2026 at 03:28:12PM +0200, Linus Walleij wrote:
> > > Changes in v2:
> > > - EDITME: describe what is new in this series revision.
> > > - EDITME: use bulletpoints and terse descriptions.
> > > - Link to v1: https://lore.kernel.org/r/20260616-mali-c55-ccm-gamma-v1-0-174fe4fedea3@ideasonboard.com
> >
> > Odd changes :D
> >
> > Honestly, I think this is not your fault, b4 should not allow this.
> >
> > Konstantin (Ryabitsev): could we make b4 just refuse to send patch series if
> > this changelog contains EDITME entries?
>
> We already do this in pre-flight check, we just don't stop you from actually
> ignoring the warning, because there can be legitimate situations in which this
> should be ignored (e.g. you're sending a 'quick feedback' email to your
> co-developers instead of making an actual submission).
>
> We should have printed this warning before send:
>
>     CRITICAL: Edit the cover: b4 prep --edit-cover
>
>     Press Enter to ignore and send anyway or Ctrl-C to abort and fix
>
> I don't think we should do a hard refusal here. We've already identified the
> problem and invited the user to fix it.


---
Some pre-flight checks are failing:
  - Edit the cover   : b4 prep --edit-cover
  - Run auto-to-cc   : b4 prep --auto-to-cc
---
Press Enter to ignore and send anyway or Ctrl-C to abort and fix
---

So my bad I ignored it. (the --auto-to-cc is however a false positive,
as I've run in on v1 and manually edited the recipients list).

>
> -K
