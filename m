Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7467BA34
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 00:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784160600; cv=none; b=HXl0YxCVk2P9x8b+Y+jWND4EwhXKahnk2Nw7Xqi+8xfjQjNDa7elTrFNaL5Nahenwe6/h+1V3PKJ0GmJLaZdYlPmy72lOJTKmP7aHQuUV3ydyMEHBtUTrZSU33FMuyMEjPvBfrK/Vjuw5vFr21M9vU3qBf28I6IaAITogpvriEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784160600; c=relaxed/simple;
	bh=4nM+paBX1lUyvtclD6djpmH4IhEllABLlI/D2DzB6D4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YhmkFhbkOHeAleyX4T+IN7G51lab8R6dotlXFY0zPv2dbEHnOW/P5NzsG5p8+6oQWUGVspG41MNJg/WPjfFMrGjtWDTv8o3yGlq3+3LFKIeNKIPfIOPlP2gIFXYu1D1EB39ip/Ri5+/55Jc2fS5N9B+VjCsZMGqfeM5dG3pyG5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A2voNK0K; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="A2voNK0K"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784160596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4nM+paBX1lUyvtclD6djpmH4IhEllABLlI/D2DzB6D4=;
	b=A2voNK0K84MPFiF4FY7TQ8U1dnlDOut6UqUci168F5Xup7KZtMAmOLEmd7xsfYwLEJrD1z
	Y63Nfr1rgF9WQaAlfr9szq3/ApDGwqI8At3g7UeeRxTYu5Jk+BhsHPFX/Lrf6ohBYfqYtp
	i+2SuGZxYpaA9pzwZK+OexCgT393alo=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,  Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>,  Derek Barbosa <debarbos@redhat.com>,
  Matthieu Baerts <matttbe@kernel.org>,  Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>,  Jason Gunthorpe <jgg@ziepe.ca>,
  users@kernel.org,  Linux Media Mailing List
 <linux-media@vger.kernel.org>,  Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
In-Reply-To: <20260715192042.4052411a@robin> (Steven Rostedt's message of
	"Wed, 15 Jul 2026 19:20:42 -0400")
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<20260715162816.GF1778116@killaraus.ideasonboard.com>
	<7ia47bmw0xls.fsf@castle.c.googlers.com>
	<20260715192042.4052411a@robin>
Date: Thu, 16 Jul 2026 00:09:39 +0000
Message-ID: <7ia4wluvvlq4.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Steven Rostedt <rostedt@goodmis.org> writes:

> On Wed, 15 Jul 2026 21:08:47 +0000
> Roman Gushchin <roman.gushchin@linux.dev> wrote:
>
>> At this moment there are 36 mailing lists who opted in for delivering email
>> reviews over email (without counting linux-media@). In every single case
>> it was based on maintainers requests in all cases of a disagreement
>> between maintainers I took the conservative side.
>
> Oh, I think I missed this opt-in. Can you add replies to patches sent
> to linux-trace-kernel. Currently, I've been manually looking to see if
> a patch had a Sashiko review and sending the author a link to the
> review and told them to please reply to the comments.
>
> Note, I have not had anyone tell me the are against doing so.

May I ask you to raise this question with other linux-trace-kernel
maintainers and cc me on the thread? Just to make sure everyone is
onboard.

Also, please, let me know if sashiko should reply to the author and
also if it should send an email if there are no issues found.

Thanks!
