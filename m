Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C925A391E58
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 18:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571886; cv=none; b=knCT9UeOh7WeCQBICFYClstHTLlOMxs3z/vKuIJy9vmbhBYtqLwC9uzo5EY9glteRRg4yDsU/7D2Losw0o5x46A+46h9aE9C65Z5hV/FKxvk/Zp7oEdpsfFsnY8QsCcFcndTJNm4E2Iy10bKUQwybpJ3xoupW1BLV9G2PSjDETY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571886; c=relaxed/simple;
	bh=G3TQcj/YkSfGten6cYDML9KalXgRp5WN3C03njyGE1A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DfQD0VxqVEeLmio1zgJZ81k3ZOwZAIf9OEnPsugU7M6t3rLB+GtZZgq7KOdiNRBbU39qaxsVO5YDWKgS+B0wTpLG28FWmHuzyKODnoCHEghJTK6fIcGQ09ioCVO4U1zqclULE+u2L1VIUwnCwis1pfHntt1qOjZFLvXIphcN+qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf09.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 08ED2C025D;
	Mon, 20 Jul 2026 18:24:36 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id 57CF32002A;
	Mon, 20 Jul 2026 18:24:34 +0000 (UTC)
Date: Mon, 20 Jul 2026 14:24:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Theodore Tso
 <tytso@mit.edu>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Roman
 Gushchin <roman.gushchin@linux.dev>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Derek Barbosa <debarbos@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260720142432.288b0433@robin>
In-Reply-To: <ce1df91e-0674-4861-90ff-bcaf5428b414@sirena.org.uk>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<alc3gAJfAkG5DULJ@zed>
	<alfBvhZkAelq5RVf@mit.edu>
	<aliMsSH373RJ31Mq@zed>
	<aloZ9hqSgzN3beqH@mit.edu>
	<20260717152559.2d2bfc8d@localhost>
	<20260720095537.4d5d503b@robin>
	<ce1df91e-0674-4861-90ff-bcaf5428b414@sirena.org.uk>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 57CF32002A
X-Stat-Signature: jg1eeiwpbnf8g9tjempskc4hoqwk9uu3
X-Rspamd-Server: rspamout03
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19i7NinCZg3vi93tCiowh9F5sHHIoJ++v4=
X-HE-Tag: 1784571874-142857
X-HE-Meta: U2FsdGVkX188ehWJJ+AAdcPyuuhJQqNovOfsyaInZvyqTVRO2amF+VE7x98+cGk1OOwCrx8hvfrRAxHZGz9VAL8QQLvRP4MTrt2CVBPOElZlYoLIT+1ibKKRbpSEwH30SreBW8Do/Jd1rI84YNAcrMUgJXmYV2eZLDs4UOxUZ4pTRXzU7VpdBe/2VRY5LNxeiPG+tSYPeD1E/P0RKE6wpliTrjzOqD9dAtEROzpxkOXXnVIgnRmHqi7980+2LL7Ute3fb12gs2On/nWRe+kWnMldxtzasEknBz9hmXyq69Vv1RMgKXjv2dqEBVavE/hdu0cT7VpPt3PQTEnyl8IUhd5GEDDNQUUC

On Mon, 20 Jul 2026 15:26:34 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Mon, Jul 20, 2026 at 09:55:37AM -0400, Steven Rostedt wrote:
> 
> > designed. But I fortunately know of these areas and can easily see when
> > Sashiko falls over it. Hence, these false positives do not waste my
> > time as I'm already aware of them. (I do take a deeper look to make
> > sure it's not reporting something similar that may truly be a bug).  
> 
> OTOH I had a submitter up to v14 on a new series over the weekend since
> they were iterating Sashiko feedback.

Hmm, we should state that Sashiko is sometimes wrong.  A submitter to
me asked what they should do about a Sashiko feedback they diddn't
understand, and after reading the Sashiko review, I told them to ignore
it.

> 
> > Do we need to add an flag to the MAINTAINERS file that states which
> > sub-systems uses AI?  
> 
> That's probably too complicated - some poeple will want submitters to do
> things like ask submitters to address Sashiko reviews before the
> maintainers will look at it, other subsystems might make use of Sashiko
> reviews or whatever but not make it a requirement for submitters to do
> so.

Is it too complicated? Do you mean it's too complicated if one
sub-system says "resolve all Sashiko feedback you receive" and another
is "You may ignore it"?

We probably don't want maintainers to require resolving all Sashiko
reviews, but at least respond to them. Where "I don't know" and "I
think this review is wrong" are legitimate responses. It is basically
saying "I want to speak to a person" when drudging through the phone
automated AI teleprompters.

-- Steve

