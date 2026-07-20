Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBE2466B73
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 18:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784570913; cv=none; b=rd7T6WfimhTZs0AgZmJfmZtyKdKyhwwxJ2gTeh53WHPiSzJaK7LwGCLPoXcXzng083ejaaDJ5Wm5dKkNr4q0xI39z4jlIe2TGYHqPPPTbPhlAJ4vl+EWCvgpTr4kkEu2ixUff7D1ndKBktMppbmAHcBfOyKC0fSiqsk+aSvsgJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784570913; c=relaxed/simple;
	bh=i67PKNwY2qTvPkn1+an8VIyp/V+mRcos1Jjg7Aw+AjI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=akyqHTqy5fjETgT54ZvPTGZ4yhRq/nUfCfxy+4PeJWu+OBUeRGQEMJs4DxQBMw3+vQXl2YbwrNMTh+gBjmBSjdgi4E97E/gTATr1dqXwy/6qzK6E5AH+PW7Va4pSNOe3Vl4JQdYjR4IcZVkjRVBKOGm6r8131OlikSVr4MkVDCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 6E30940275;
	Mon, 20 Jul 2026 18:08:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 5C22C1A;
	Mon, 20 Jul 2026 18:08:20 +0000 (UTC)
Date: Mon, 20 Jul 2026 14:08:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260720140817.16a8924f@robin>
In-Reply-To: <20260717123257.GR1778116@killaraus.ideasonboard.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<20260715162816.GF1778116@killaraus.ideasonboard.com>
	<7ia47bmw0xls.fsf@castle.c.googlers.com>
	<20260717123257.GR1778116@killaraus.ideasonboard.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 7s7mxbg6xnia144fzwkwdjk9ici1f87o
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 5C22C1A
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19o98/NBZ4WrsDdNiYCWC2gkcLZb7gSGE4=
X-HE-Tag: 1784570900-447772
X-HE-Meta: U2FsdGVkX1/PQo2T6TaNjpIafv/EuNw7Y3OVouBe2dvQNyNjLHHIJSzybl9+0rnCRtLYhbPWRtfr4gVZCGJiUr4lmJX8nNFN0pUxKDoMi8r1BwlN9FLhyNdMBJmLHEJhRwHT4xzxxojJYSlf6lELm7//C/WxFWLJi7A073MpO9PP8bHrlpqcdZ74DYYcErTPwGRnnwA5VuAszRGXjWTq3xBtVFXYzXaukuZgLEsk1RyI5TvAG2Tv2prpAajXm8/I1UZvkGs98BvyzmW7kXiAjqISM+ZX2jhUa2yhXAsOW6hBr3TQSolT57GTirTAbuzREsNV7WlQxgBxExgxqvIqI9a2/aTvt1V+Yp1MPWb8oOiWJ+tfUKtDxH6gjBWFWbvz

On Fri, 17 Jul 2026 15:32:57 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Where are the AI companies when it comes to addressing the massive
> underfunding and maintainer burnout problem, to help doing the ground
> work making the kernel more secure ?

Ask Roman how many people in Google are supporting the Sashiko project.
I believe the answer is 1.

-- Steve
