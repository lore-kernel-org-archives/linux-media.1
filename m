Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC25B38DC76;
	Thu, 13 Aug 2026 21:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657007; cv=none; b=qe2WZEXGLNOKzvlVKMoI7ZafwAG4ileRBbFRnDQbnuxCoJYY+TremSUU7V70yeUNXO6jkVxpCeS5mAlRd5Y7a6rcYTMlD9nI58B4FZH+Rh0/u+iMd07wh1A5PkALiZpcr8ts9dM5udJ+bl9M051yL80Ie7YdsYoA/I1ZImrST/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657007; c=relaxed/simple;
	bh=LlbLgsqD2IbOVv0Jsf9fhi3bPGruZN90ykQQaJgnbmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtOBwll04IuuSZnJp03StLz4Vc8IR45L3VOkzC4hL19/S3qb3QdZFOYGZIOrv5FcjrJKLArEKyJyUMYagHW3xfSuxuF45zVX0Xz3stSvrTWR0WsKZZHswWJBK0g9Q3Gjir3cAa5YCyOUo9OyrGpNUM48qdbGJ00cJ6ttEtfHvk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=S8HR/4Ry; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="S8HR/4Ry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1786656999; bh=LlbLgsqD2IbOVv0Jsf9fhi3bPGruZN90ykQQaJgnbmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S8HR/4Ry0Dyua2GNizGvyQsxPt0Jbt/7d9Yr/AbQUpGHoMeNuZoVX/klAK0X1J/Pu
	 hcN8XpM0+ZYBb9ZTXfyN9Iz6ZzWHNaCvwu89aVc6DU6T3bxpjqECRytrCwoTeoKxJ0
	 SQU/jIiGAIpK46JnOhcVkdV21qJl0acGdxe4XUrsVEKC3OEdx1jsmUSwawt7kc17dp
	 AlUA3TnU84scWRXvkGTTPlVGPV6f5aiHXi80AlBNa8WgxC4kNCEiUR+tGew2QLYP2G
	 NJRV8Q1wOn0/if3vBU9zLHgCYUWwN8GD/IEl+kxUtEIchh7fn6M7DTcMua0XLNgopZ
	 tGXdIv1u42SOQ==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 89B3741567; Thu, 13 Aug 2026 22:36:39 +0100 (BST)
Date: Thu, 13 Aug 2026 22:36:39 +0100
From: Sean Young <sean@mess.org>
To: Rik van Riel <riel@surriel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jarod Wilson <jarod@redhat.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: redrat3: fix UAF in probe error path leaving
 rc device registered
Message-ID: <an445yFx1W3Cp_pJ@extorris.mess.org>
References: <20260808232031.500f781c@fangorn>
 <an3ObNj_uyRJI2tY@extorris.mess.org>
 <fc39e12b113f2e03f1dd41afc48267874379b554.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc39e12b113f2e03f1dd41afc48267874379b554.camel@surriel.com>

On Thu, Aug 13, 2026 at 02:34:52PM -0400, Rik van Riel wrote:
> On Thu, 2026-08-13 at 15:02 +0100, Sean Young wrote:
> > > https://lore.kernel.org/all/6a74a76d.ec7c9571.3ac9bb.0056.GAE@google.com/
> > > Fixes: 2154be651b90 ("[media] redrat3: new rc-core IR transceiver
> > > device driver")
> > > Cc: stable@vger.kernel.org
> > > Assisted-by: Hermes:muse-spark-1.2 syzkaller
> > > Signed-off-by: Rik van Riel <riel@surriel.com>
> > 
> > The commit message is very good. Your patch is very similar to a
> > patch
> > I wrote earlier (which still has to be reviewed, I can't merge my
> > own patches without review into the media-committer tree):
> > 
> > https://lkml.org/lkml/2026/7/29/1730 
> > 
> > I don't really have a preference for which one to merge. 
> 
> If it's any consolation, Sashiko suggests there
> is another race condition left, pre-existing in
> the code.
> 
> https://sashiko.dev/#/patchset/20260808232031.500f781c%40fangorn
> 
> I would be happy to review patches to fix that.

Thank you. I've think I've got all them covered. The first series
is here:

	https://lore.kernel.org/all/cover.1785338381.git.sean@mess.org/

I've got another series almost ready to go (mostly locking issues).

For more than 10 years I've been working on rc-core (on and off) and
I convinced myself it was pretty solid. It turns out that I was
deluded and Sashiko found lots of embarrasing problems. It's a shame
that I can't prompt Sashiko to find all bugs in rc-core. I have used
claude, and it found problems sashiko missed (and vice versa). 19
patches so far for problems llms found, which is a lot for a small
subsystem.


Sean
