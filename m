Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848C5472F81
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 23:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784677466; cv=none; b=Im3yWd69omdtPKEoE/xJlR25pHXEcwX4zINwTpovS5r7mmbdXbrezVaruNoxKnvyfUtv+VY81heQVINCFZjK/GlSDSAtLJjB6B242+Ae1cmqLmVJSFrT3wL5xoE5nfS23z0ThFmnrHhgH4WoGrW/yj/vDIYf20R0r9Wza+W32+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784677466; c=relaxed/simple;
	bh=9ke5ltpMyww31VXSxFjqz1I+HezOOV09TDv11cJPjG4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgArpunvAcyEz+ZefXkC3gX6qd9LZV1j+Cb2qr8YP109geJX+QDtD0d3BWb3SxbLnhrHpMel4h6NidnW+7CgrZWApsuZq6eMWUhp547jN9c5/PVRJUafkadXr5nqZoiqKlY3+d+0KU4CI/l9aDfkP/LM+MdQZEnTL71gBd2kaqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf10.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 8810B80303;
	Tue, 21 Jul 2026 23:44:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id B7AD732;
	Tue, 21 Jul 2026 23:44:16 +0000 (UTC)
Date: Tue, 21 Jul 2026 19:44:15 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jan Kara <jack@suse.cz>, Theodore Tso <tytso@mit.edu>, Roman Gushchin
 <roman.gushchin@linux.dev>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260721194415.1b1729d7@robin>
In-Reply-To: <20260721224328.GH536385@killaraus.ideasonboard.com>
References: <20260713095538.3d5e86f1@foz.lan>
	<20260713094120.GD1127719@killaraus.ideasonboard.com>
	<20260713220427.582b28bf@foz.lan>
	<7ia4mrvtrxjl.fsf@castle.c.googlers.com>
	<20260715005909.GF1656185@killaraus.ideasonboard.com>
	<alcBvuIMEGSjAD1R@mit.edu>
	<20260715161111.GC1778116@killaraus.ideasonboard.com>
	<j4jhhj6rw6kgem73slctakegtoirqmngbejbabfnfwtyshdlgp@itpaup6ghuod>
	<20260715202808.GN1778116@killaraus.ideasonboard.com>
	<2vzlg72ohneu5djixzhoz4s4bharc5i7hzhe4wvhcx55ae3vx4@unh35s26hbiy>
	<20260721224328.GH536385@killaraus.ideasonboard.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: gyy9fk4sckxyi4t8qr3hjtnwrx5pu6pb
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: B7AD732
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+p0pxa1B+D2dLgalffjacdvHfeRJUtbvY=
X-HE-Tag: 1784677456-150218
X-HE-Meta: U2FsdGVkX1/lHoqIYjHsgU2lR7kZMDLd26HwLTzfB/k/Ol3n843/AMxBZTWZlrWKyMUmNQHWhfamSIOv9F9xpLRAnPoo0ydiY56KEUIjIxGvW59fHV6zKykw7MD4F3O3QRmOaInJF6pCZG2ezHRFe757Hk9shVD1DO1S3StRHIXPlq+29xynGDAm2oYrw60I/4ATqtpND2doeZZI+puziNsbrnWTNN0+gEeV29+hV0nG1ocgOrchFYyAqtU+1yfslai9xl4g/CW0aNj7tW50KvZjquaGObkQ49knMKcOWRSBnP9O92aSmLXAT6XCwQ3Lu2UZuUS96fPpqBYm9kqN47AX4rocPqbfl727EwkMiMl0KgZwFsTrI0F/XF2eC+5c

On Wed, 22 Jul 2026 01:43:28 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> The other aspect, less related to how maintainers react to the reviews,
> is also less related to sashiko in particular. I think there's a
> fundamental difference between receiving feedback from "regular" static
> analyzers compared to a machine that is made to express itself as a
> human. The 0day bot doesn't feel like it's trying to trick me. I would
> probably have different feelings if sashiko provided reviews in a more
> "machine" language.

Or it could just end the email with:

 "Deet-doot-dot, I am a bot."

 ;-)

-- Steve
