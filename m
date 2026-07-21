Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6442A43E483
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 23:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784677277; cv=none; b=F3+x1DTGsk9lYrWOKEPNQSi5Lw6ZYZKDMFWhJQBnR7WuMK7dE8lkE5XEzLFXH9dUL1V2dpPOrW2jYMNQlM9vvfoEDlN7mI3ThGq8upiyGhFzGsyfn1dXqcyq0h6enwE9Jo2xGOmzmPFvo3QbRYClREWeJAwfdJfOhCjLrDpxCLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784677277; c=relaxed/simple;
	bh=Y37Ue9HV9c2drV6iCkTm577zL9pEdXuYJaRbZyc3A9E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fEnuwZ9YwMdaDHlERLktDWhQ17HVRTQNuUXywgbc1pBT6HU3ir/GKFUJ4Uf+sEwZ3B2TOYpdeo07bDHDve49aH3/h6XLJf+tYR9JhJzlG1oA7yL55qXwdhwLIFWl4kBzU+n0MjcC+ifw88W+R9e2GxmGv6z5FTWElT1xSKHlKM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf17.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id C940AA0BF0;
	Tue, 21 Jul 2026 23:41:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 30EDA19;
	Tue, 21 Jul 2026 23:41:10 +0000 (UTC)
Date: Tue, 21 Jul 2026 19:41:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260721194108.503f5e0a@robin>
In-Reply-To: <20260721224642.GI536385@killaraus.ideasonboard.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<20260715162816.GF1778116@killaraus.ideasonboard.com>
	<7ia47bmw0xls.fsf@castle.c.googlers.com>
	<20260721182509.GG536385@killaraus.ideasonboard.com>
	<20260721152501.0ff97e8c@gandalf.local.home>
	<20260721224642.GI536385@killaraus.ideasonboard.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 30EDA19
X-Stat-Signature: rmyad676r1ne8duficcho1ixzywzfz64
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+RiBV55ruibk6PmKsewYpnEpD0b6FsEiM=
X-HE-Tag: 1784677270-294646
X-HE-Meta: U2FsdGVkX18URcdnhBvQNAhKT3bXRMrgY4BLunqeFsxg/C8eFv/1U2yo+lisDJ30GPUw4GopYsM8X+GCWeclMtyP/LfGk8NQFJPVEAswTCYCCfjqvcx8vZgCjO/+LCpHCHGHuuxeswB8xseILHsUYnriHrIzACVz459zMHI4Ye3oJsIfkUB3JlOrR5J2OeORW6qvdWZNh+um0eOQDgs2EotHEkew5ufqzN5UEWDjLAjfduTuUQScNCkS1uqUvfTvbmNyo1QHBBz8QsjSd1dL4wbXSuMo1Lnoqp7Bv5tsNe/KhAA4JEl4/VCE4xXdonwhXVMdri/EiyNGdrRHc8th3gHSXOK/WzaT+69uBhPornAHFheiDJ8EpN1by05eiwy9

On Wed, 22 Jul 2026 01:46:42 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> As you said, it's not mutually exclusive. I'm sure Google has other
> kernel developers than Roman.

Yes, but they are focused on everything AI and not the Linux kernel.
It's the main reason I left Google.

-- Steve
