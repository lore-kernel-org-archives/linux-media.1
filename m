Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5443377A91
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784157674; cv=none; b=ATNXS3NOZLFJVtViC+zJQGhRtFdbBhNSj0Y7C9unBt/HNwdRPRqI0mpN/CTDqO0uSXYYikEcLWqJB5CM0hhOTuNyJ5kLQfxLShp7Ucn+yx9li4a+ESZUktOwenYXXhmuSyVesnwVJAoz5zNmleGKqhH99VCEIqf6o9a5g71kPms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784157674; c=relaxed/simple;
	bh=6bJIfgoJ7MZuBzirQYMGcPRyXN1x7ntAF26siKnW7IE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iwHmMx4F9O+2y2McqG2NGg7mDGdqNwIT08y6KgXnLdpNfKkE5hlvFZqL1fNlA+q6+HmMOlMh35bUk5tU8YeIruSEDqrB7d/dY3A5kxgerGcaWPMS57buFVAxdAlDolIidnHZUv5jlFBuZuYBpFTCaugcvZaoUgyh/hdxH6y7Mk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 886791A035A;
	Wed, 15 Jul 2026 23:21:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 64BD22000E;
	Wed, 15 Jul 2026 23:20:54 +0000 (UTC)
Date: Wed, 15 Jul 2026 19:20:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260715192042.4052411a@robin>
In-Reply-To: <7ia47bmw0xls.fsf@castle.c.googlers.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<20260715162816.GF1778116@killaraus.ideasonboard.com>
	<7ia47bmw0xls.fsf@castle.c.googlers.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: bi4c3smx6jh4xty63ta14dmoi9cmpz38
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 64BD22000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/HTNbolD1Lc2V2OeMMnk0D+uLIjHuNCTE=
X-HE-Tag: 1784157654-322616
X-HE-Meta: U2FsdGVkX1/ReY1hevooIIfFZWfE33i5ZSO/WTm0Skp4vWmBdFv6OsY+Irvv4OJYm7JMhzohVUtmbN57SGGI38K8utz9IdL8YypWBlxaw3K++db8xuUW0CibCOngHbYWVuEOd6xeI13SgZ1Moov4leJvFujS8WTrZt7UGeyVK0egaO6sNYASU+bKXWH4wN0Yj3lPqnTEdE/7NUvIttvyoSiuyDQBz5Xh5Obhnta/PgdcNUQkwkXnivA4J8vtFKku37iPrT+ojFK6BszZtwA6hRSYG1W4y1sLCIXa93xNiS9VlovpGo8V1Aiddi7qjQU2

On Wed, 15 Jul 2026 21:08:47 +0000
Roman Gushchin <roman.gushchin@linux.dev> wrote:

> At this moment there are 36 mailing lists who opted in for delivering email
> reviews over email (without counting linux-media@). In every single case
> it was based on maintainers requests in all cases of a disagreement
> between maintainers I took the conservative side.

Oh, I think I missed this opt-in. Can you add replies to patches sent
to linux-trace-kernel. Currently, I've been manually looking to see if
a patch had a Sashiko review and sending the author a link to the
review and told them to please reply to the comments.

Note, I have not had anyone tell me the are against doing so.

-- Steve
