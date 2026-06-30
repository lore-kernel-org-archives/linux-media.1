Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7932135C5
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 20:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782851561; cv=none; b=guYOrLj4CwwgdLCf9VdUO+HOLsYqjqS+wxatnx2tiS/r/0zU+kppi29dxJg8bWZsoUQvQifXpfB9hR+DCR06EU2UyzlzzV+Cd6c64vjcDL2qm9af5lVRYgirBrE7Bs5mmWARhoB5F9I+gwTnaRONEBAn2LweNCV1NbtT6MmE80s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782851561; c=relaxed/simple;
	bh=TP621yHWwXkn5FMjcTwR3PqkZFVTbmLIPKfhuh27df0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVEhb6ZTw9tbQQgWvxrEzdHw/CthhmSpWMIcmQdSEu8HT05IsFQpVHB/rWHxBRb+t40Qecb05BZWmrJCPW36O7zc+x3ho/Op/zyzebgV9gHEzc8HVNMYsTdsb0dvj+iORcB9jYIewqW2eHragKU1sGIfeeev13J0TRasL6elbYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eVWvFp6S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eVWvFp6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782851559;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=/eF0xrFSmEysuPA8eTvDUwliNyRVDCLqqcDvqn/3e7Y=;
	b=eVWvFp6S5cMVKdnJBU5k9U1opiDBS6Tksu450m0HOjdBcoL9BYeKKoZ39cIpjY6ok4e/gX
	fXbKKzNnE+5yrs42lGLeCjA1RM5lzYIp+ctCRM1VgtG3AOPFsqq9NSVZVMK1KCXif3ocRo
	b0C7+3HaEf/yP039zzARKobU6J4cdg8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-547-VmvQVT--O_eaiTgOuCgLLA-1; Tue,
 30 Jun 2026 16:32:34 -0400
X-MC-Unique: VmvQVT--O_eaiTgOuCgLLA-1
X-Mimecast-MFC-AGG-ID: VmvQVT--O_eaiTgOuCgLLA_1782851553
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A645E184A0B4;
	Tue, 30 Jun 2026 20:32:32 +0000 (UTC)
Received: from localhost (unknown [10.22.81.100])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C86B236512;
	Tue, 30 Jun 2026 20:32:31 +0000 (UTC)
Date: Tue, 30 Jun 2026 16:32:30 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Matthieu Baerts <matttbe@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>, users@kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
 <20260530200017.0fe7f685@foz.lan>
 <20260530204945.22ac92c6@foz.lan>
 <20260530205351.19847fc8@foz.lan>
 <ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
 <7ia4tsrkn1k4.fsf@castle.c.googlers.com>
 <20260602223936.27def657@foz.lan>
 <b9f7ca3a-fa72-4a8e-94bd-9991a0882f10@kernel.org>
 <20260604085201.177ad537@foz.lan>
 <20260607195656.02788791@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607195656.02788791@foz.lan>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On Sun, Jun 07, 2026 at 07:56:56PM +0200, Mauro Carvalho Chehab wrote:
> Added both global and per-project permissions to add CI checks:
> 
> 	https://github.com/getpatchwork/patchwork/pull/653
> 
> Tested on a docker container created on the top of current
> upstream, with the database imported from linuxtv.org and
> migrated to the new permissions model.

Hi Mauro,

Patchwork integration has been cleaned up and the original issues filed against
the Sashiko project have been resolved.

Any progress on your work for the permissions modifications (or enabling it for
media)?

Cheers,

-- 
Derek <debarbos@redhat.com>

