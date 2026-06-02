Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5DA3E5A2E
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 15:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780415512; cv=none; b=Ujthurm2pAtZ3hXcZ5Peugyw11k9YCDdL0+fnhWTDGUov+r/6oE0kb9/Hif27zlOg+RCbdd+xx6f9FdIxNgeuGYhYRkqtUUp117aVExMbr5RFwY14jrT2PESh0SpvnvRl6hrsMjWG8Cnvy1OHi1nZc8PZlktBysWRJRdV0XD1o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780415512; c=relaxed/simple;
	bh=RlvSw/Cn65kMSZSDi7nFvoSYU1V8dh32MgyR1XMwkww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0b4wjqKlnwweq+tvQvXZP+KFd3rbZGIzddl8OjWBCSWepC5lj1b4u0vH+MVVi5xsrG4fd01Vjskk7owl/fsLA1qkn3rx1Iwruu5iB8exLJ+k0PS10uXMqOAei/+WByqI2NGcdSwbiqMq1QGqk3wNyFVTSFrF89ZdQm7R5jeejM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TvfgkTMO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TvfgkTMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780415510;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=ue6Ua2uOgN+ZiOMD0n2tZtnQGEVnfG9xdRtXgO7Bw+0=;
	b=TvfgkTMOyTv5+CVNsdjnCC42TZmBoEE9qyEZpIoEm7ODCcRRUOM32qbmV9a1RUqVXs8kNn
	FvLkdEEHujaAx4MGiYmYI5Q3S1cyaZrVH/q7LimTYgJBrktYgU1xjYzTdg5aRu3aPIymjI
	z6pJo0s3+8eekvR0v2RGhU/AOVbJw/U=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-493-aRIsSNYRPTiGXR0SDGIoaA-1; Tue,
 02 Jun 2026 11:51:45 -0400
X-MC-Unique: aRIsSNYRPTiGXR0SDGIoaA-1
X-Mimecast-MFC-AGG-ID: aRIsSNYRPTiGXR0SDGIoaA_1780415504
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 00495195608B;
	Tue,  2 Jun 2026 15:51:44 +0000 (UTC)
Received: from localhost (unknown [10.22.80.60])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 461C61800347;
	Tue,  2 Jun 2026 15:51:43 +0000 (UTC)
Date: Tue, 2 Jun 2026 11:51:42 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <20260530103004.6fe2ffa7@foz.lan>
 <7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
 <20260530200017.0fe7f685@foz.lan>
 <20260530204945.22ac92c6@foz.lan>
 <20260530205351.19847fc8@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530205351.19847fc8@foz.lan>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Sat, May 30, 2026 at 08:53:51PM +0200, Mauro Carvalho Chehab wrote:
> 
> In time: problematic in the sense that the first project that
> picked it is likely the patch "owner": the token will require
> maintainership on such project.
> 
> In practice it would mean that the token used on patchwork instances
> with multiple Kernel projects may need maintainers permission on all
> such projects, as otherwise patchwork update will fail.
> 
> Thanks,
> Mauro
> 

Hi Mauro,

Just to recap the the thread, to confirm that I am following it correctly:

- Patchwork only supports a single URL mask for message-ID lookup (lore or
  sashiko). Adding a sashiko link would require diverging from upstream.

- pw_tools is a workaround solution to get/set status on patchwork via bot-mail
  parsing. pw tokens also have broad permission scope.

which that leaves us with two "methods" of integration:

1. The Sashiko daemon calls the pw_tools script directly to update the status.
2. Sashiko sends a single-per-patch-email with parseable "status" to a mailing
list, where some running daemon will pickup the mail.

please correct me if I am wrong here :)

Roman, for 1, do we want to dip our toes into FFI for the provided pw_tools
python script, or would a more general std::process::* subprocess suffice?

Alternatively, we could just translate the logic into Rust, gated behind a
config. I will have to think about how we would like to implement retry-queues.

Thinking out loud: would it be simpler to "tag" the reviews that require a
patchwork-status-update in the DB, and let a cronjob handle setting patchwork
state? updating the candidates that have successfully posted?

Anyway, Mauro, I think we have the capacity to tackle both patchwork integration
methods. Would exposing a configuration in the email_policy file that allowed
for mailing lists to specify what type of patchwork integration suffice?

This way, a mailing list that would want patchwork integration can opt for
either the single email approach (as you described) or through the API?

something like:

[subsystems.linux-media]
lists = ["linux-media@vger.kernel.org"]
reply_to_author = true
cc = ["linux-media@vger.kernel.org"]
+ # optional value can be set to email or API
+ patchwork = "email"

Roman is currently working through how "subsystems" are detected via Sashiko,
taking inspiration from the get_maintainer.pl script. This may help with some of
the concerns I saw with patches-meant-for-other mailing lists?

Cheers,
-- 
Derek <debarbos@redhat.com>

