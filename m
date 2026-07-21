Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49846EF61
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 19:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661486; cv=none; b=JhDTmC5nRtO2uxAYblZMlnTBCPro+RcllhVCJ5kz5x2pTYHRuI+RiQw+WYPmOzzM0cTCaTCV1yYFq4jXqE/VaiSTf1i8Jpb02gEOFsHaDA7Y0TOLPtoF8Viv7NbCOopq1QREhHR3UdTqlpL8+iuevIJiH96B79xv7MQA7JrY4DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661486; c=relaxed/simple;
	bh=m0ZRfFKXwjpMf9uwUeE/g2eEalMO9vBxa6A4B+pYBoU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t5t4n3SELEOCM7tE/KYfssBeoGsCn82Ea4g6Qqyi0Tbm38l6bqnwM4is71JHTQJQVUYR8J9cCA5oYxAln+CPOffnKTC1FghW+GIfNRI+pbIPyFF32LMZm4/6TbJ98Drb9LsOO/QgDUr8SFMBBfZAhGjxg8rwJLrM/893+S3w6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id AFDE3A01AA;
	Tue, 21 Jul 2026 19:18:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id F1CCE3C;
	Tue, 21 Jul 2026 19:17:59 +0000 (UTC)
Date: Tue, 21 Jul 2026 15:18:18 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Theodore Tso <tytso@mit.edu>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Derek Barbosa <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260721151818.5e7981f1@gandalf.local.home>
In-Reply-To: <20260721171249.GF536385@killaraus.ideasonboard.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<alc3gAJfAkG5DULJ@zed>
	<alfBvhZkAelq5RVf@mit.edu>
	<aliMsSH373RJ31Mq@zed>
	<aloZ9hqSgzN3beqH@mit.edu>
	<20260717152559.2d2bfc8d@localhost>
	<20260720095537.4d5d503b@robin>
	<ce1df91e-0674-4861-90ff-bcaf5428b414@sirena.org.uk>
	<20260720142432.288b0433@robin>
	<20260721171249.GF536385@killaraus.ideasonboard.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: F1CCE3C
X-Stat-Signature: ejj5itxcj3r5tuqi6suso6g8u981w7jm
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+6Ro2WRWjlCTT3WE61puHqUeU5MefS21Y=
X-HE-Tag: 1784661479-503795
X-HE-Meta: U2FsdGVkX1/Fx+LmeF7eIcQRsg1CSyEK5P6s7Jr3xHNoBoXFu+sFOpiEIDBDyXM669vSp3ph2Z5ahvaemMjrxwdWQM2m35c7InkGspqN8QtFOBh+Y9l0F8saI50hZjE1KY42ztBQLIGh/nBOm9Py9qUOfHtK5cv/l3P9w6KSsLUZUcWuG3X1/UYMWRR1nke6Ayy+eqbezXxu3gtvhQAmt+Q+9sIPc+EbhEQg+TM/JxI3pi4m3DfxpKQFivKVGonyTqUdT35akeBkLXYOWZuQTgXvg2pmpxg6cHNAhSz+748ZBIIt7DLQsebb4Sf2M8FVTyaXXbmFEvc+dybvaQ3jSTxDgmKJ3D1jLRWYeIKpQ7eIaaUTLMg9+U1XF/XUQmlA

On Tue, 21 Jul 2026 20:12:49 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> > Hmm, we should state that Sashiko is sometimes wrong.  A submitter to
> > me asked what they should do about a Sashiko feedback they diddn't
> > understand, and after reading the Sashiko review, I told them to ignore
> > it.  
> 
> We discussed this at length in linux-media. There were proposals for a
> custom header telling patch authors that in case they think a flagged
> issue may be incorrect they should reach to an experienced reviewer (or
> just ignore it, the wording went through multiple iterations). The
> problem there is that, by definition, a junior, unexperienced developer
> will have more trouble determining if feedback is correct or not.

Then add to that header "When in doubt, just say 'I don't know'".

But for obvious issues (like error paths not covered), the submitter should
be fixing them and sending a new version without bothering the maintainer.

-- Steve
