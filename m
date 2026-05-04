Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB863A758C
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777893074; cv=none; b=glR3Wqk+xzAXfBhvn1BsxLfQVuQkt/ZbpGld/A/zps+zGTnm2JGXI5RbH3nwyYJu3vLKA09ObmtMhRd61pOX+XDnQO4ieN4Dlt7aMw87jTxpPodR6I4Mc+fzFt+9qTh5OdVn5PckJZw31/6vUJnqatd4Mw1Blw07W0mLcTNpnEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777893074; c=relaxed/simple;
	bh=/OPboIEOOBeWaJTEg7Sh2XiRQBst3W+E3byqKwAO40Y=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrrW32E4y9gdAx1GbBdo7bQgBC0Kwl3Th+YStQrD+QDuxZDCslf/Fy7IHyQ81VEQCOaYI2kP2sqswoJaYErS1LLcv7FzHicNZgcJHXzbHsyaKwi3QveR0OKFvgdhpISvzLVB7iNjwTQN7nqqcCQsJ/EROF0haxKFbbpSZ6ECdYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wJrCY-000165-73; Mon, 04 May 2026 13:11:02 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wJrCX-000On2-0w;
	Mon, 04 May 2026 13:11:01 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wJrCX-0000000Gbea-2V4Y;
	Mon, 04 May 2026 13:11:01 +0200
Date: Mon, 4 May 2026 13:11:01 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/3] media: imx-csi: cleanup media pipeline start
Message-ID: <afh-xcWC2p62-QvN@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-staging@lists.linux.dev
References: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
 <aXOoc0lvAtPt0fAL@pengutronix.de>
 <aco5Ei1B4vJWKMMj@pengutronix.de>
 <acqK9Ms_eRxg59Xa@lizhi-Precision-Tower-5810>
 <adffNaI6hQbc1mAO@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adffNaI6hQbc1mAO@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Frank,

On Thu, 09 Apr 2026 19:17:41 +0200, Michael Tretter wrote:
> On Mon, 30 Mar 2026 10:38:44 -0400, Frank Li wrote:
> > On Mon, Mar 30, 2026 at 10:49:22AM +0200, Michael Tretter wrote:
> > > Hi Hans,
> > >
> > > On Fri, 23 Jan 2026 17:57:23 +0100, Michael Tretter wrote:
> > > > On Thu, 18 Dec 2025 10:23:48 +0100, Michael Tretter wrote:
> > > > > The imx media device currently assumes that there is only a single media
> > > > > pipeline. However, the media graph has multiple imx capture devices.
> > > > > These may be started separately on media pipelines if they don't cause
> > > > > conflicts in the media graph.
> > > > >
> > > > > Move the media pipeline from the media device to the capture devices to
> > > > > properly track and handle multiple media pipelines for the imx-csi.
> > > > > Refactor the code to start the media pipeline from the driver to help
> > > > > the reader.
> > > >
> > >
> > > Could you take a look and apply this series for the imx-media driver,
> > > too? The patches are already reviewed by Frank Li and Philipp Zabel.
> > 
> > Sorry, I will take care imx's stage driver. I already sent pull-request,
> > which included your other two patches.
> 
> Thanks for taking care! I found the other two patches in the
> media-committers repository.

Ping. Would it be possible to include this series in the pull request
for Linux v7.2?

I couldn't find the patches neither in media nor in media-committers.

Michael

> > > >
> > > > >
> > > > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Improve code readability in Patch 2
> > > > > - Update commit message of Patch 3 as suggested by Frank Li
> > > > > - Link to v1: https://patch.msgid.link/20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de
> > > > >
> > > > > ---
> > > > > Michael Tretter (3):
> > > > >       media: imx-csi: move media_pipeline to video device
> > > > >       media: imx-csi: explicitly start media pipeline on pad 0
> > > > >       media: imx-csi: use media_pad_is_streaming helper
> > > > >
> > > > >  drivers/staging/media/imx/imx-media-capture.c |  8 ++++----
> > > > >  drivers/staging/media/imx/imx-media-utils.c   | 12 ++++++++----
> > > > >  drivers/staging/media/imx/imx-media.h         |  7 ++++---
> > > > >  3 files changed, 16 insertions(+), 11 deletions(-)
> > > > > ---
> > > > > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > > > > change-id: 20251107-media-imx-cleanup-9022d941ae44
