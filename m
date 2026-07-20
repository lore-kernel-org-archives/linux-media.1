Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183B64266AA
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555752; cv=none; b=nu+0JntpOT4pTo73etvNJtrMwA7oNsk9AQDkCL4CWoZVroZ4Qqaombg7R59L5TFPwBaendCbiSkqDpZ4uYOKYV1PMtLXu3pimmrSx/suK7JFfTpeIj4p1iss/m9uAk7EDUJomh3hEcQmo+UKakuXiHoPjbTn+8RGItQV2VTlUko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555752; c=relaxed/simple;
	bh=Kq+UM2Wm2ncOIBEymffiKfPeL8NrroLxacjR3//p7YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dhpSbNXnSmMIvHyFQILtTtr4lBEd2RKNTUWoGJwENqL3y0BxG5Z4NjLDmY1oKezjXxH3jzlPssGCL7CuLqm6O9oEzUQs7yHsTsgqY9689fqrXq/15xLXEj3SWxtgDr+7+EqAziqe6FbDC1x7UX3qqYVGo+ZUD9IVKgDL/CVK1wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id C1A46801A6;
	Mon, 20 Jul 2026 13:55:41 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id 035B920029;
	Mon, 20 Jul 2026 13:55:38 +0000 (UTC)
Date: Mon, 20 Jul 2026 09:55:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Theodore Tso" <tytso@mit.edu>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Derek Barbosa
 <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260720095537.4d5d503b@robin>
In-Reply-To: <20260717152559.2d2bfc8d@localhost>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<alc3gAJfAkG5DULJ@zed>
	<alfBvhZkAelq5RVf@mit.edu>
	<aliMsSH373RJ31Mq@zed>
	<aloZ9hqSgzN3beqH@mit.edu>
	<20260717152559.2d2bfc8d@localhost>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 16d1pgkbtmi4dnhzkgafiyygri17uc4c
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 035B920029
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18mQ3vigKRpZhjIp1nS1hMSLrp3Ub1oUOo=
X-HE-Tag: 1784555738-704091
X-HE-Meta: U2FsdGVkX1+BAAkFyQ3TZUJF2Wxap3gHaW7oEK9gVO9Il5MwWoVQFrEYj/2EdPEqh0oVELWXDpObBE6qjuFHv+Wlu2jLhgPX5mw+Ldl0BTKg0zc5v3Bac26V4Ow0bJOthPnj/XutOHsRUKiaQHLSB1LD9i/lQGDezcsYgB6VePZUEOT8tdraeb+UnQuCiZCOj9k83hSi2ki8HOiauVc5DO1dy1KvNMbtEhckj+LlGq0qHCq+qKnEwnhHffRdHxPF2Wt8J3Eq3zr7P7fuauRsyld5lLVHd2E91iOz+yCoN0kwzShMGbQm4jmJAey8jd9I9fNffBCW6+y54L+04lHtO533pSfxx+dk

On Fri, 17 Jul 2026 15:25:59 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> That's one of the reasons why I do think media needs its own custom
> prompts.

Reading this thread I've come to the conclusion that different systems
have different results from Sashiko. Sashko gets confused with some of
the tracing logic, but that's because tracing does some hacks to keep
the overhead down (it's where live text updates started). It reports
issues sometimes that are not a problem due to the way the code was
designed. But I fortunately know of these areas and can easily see when
Sashiko falls over it. Hence, these false positives do not waste my
time as I'm already aware of them. (I do take a deeper look to make
sure it's not reporting something similar that may truly be a bug).

But I can see where this could cause a bit more problems with a
different sub-system.

Hence, I don't believe there should be a one-size-fits-all for the
entire kernel, but do as we have been doing and have everything be
opt-in by subsystem. But that also means that if you contribute to a
sub-system, you need to follow their rules. If you don't want to deal
with AI, don't contribute to a subsystem that has it set up where you
will receive an email from AI if you submit to it.

Do we need to add an flag to the MAINTAINERS file that states which
sub-systems uses AI?

-- Steve
