Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D6F4A13AF
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 17:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137317; cv=none; b=Rf6dpn5pCo9SXj7iUVLvR2rIQ0kcA3I9tP7jaOTsilBfDOoQa/jy1mu7iZuMg1vSoLDFyMGqzjGUvitbFBRxbhi9zbr0sz5KtgX040d1F3LKZGmEN/bema/Qw3Cd7A/J1gmYggkyyYnmLdUd4ZNRs/VXiTXE3UExpW8cvsu6D+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137317; c=relaxed/simple;
	bh=g/FkcdpRE4R0tn+Q1qbct0qceIo3EXzzJncWQuMz9+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYFFR125j0O7oQnlcxzf3tFZj3t95XBtPyF+nJZXzxpXCzS5K6uObyOdqnOr0d4CJox7Xxh68KIHvVtB82WWaLVwzX3MCb/cd0eU3f3TLoqGbOWHBMwY5BL+pUPpu3jNlu2qD6De62gwSYv8ZbasYwxlfMgL79vTInSd+mVweQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=opH63vg7; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="opH63vg7"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8f032b47e3cso46550936d6.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 10:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784137314; x=1784742114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uDRO6QnIuhEalRt5fJnXrzp5+6VFXuv7uQsJZiUJYuI=;
        b=opH63vg7rMyKuWaL0T4BpcikdteK1JUez3hnULji3WebGIOyqsY+FxvHpTfPrFoDSM
         2y7y2j/fr6G3MGoukENeDBZ6asmPfW9GAGMP9pvf8WntmValzu3LhhuKKh4WPCQxC2xX
         IB0fieEEfCi+YxRZt0vKchAKfslOmOAfHg9JhphlDZfyiNUtOirErwqEL9wZTDD2OEUO
         g1sfZ9gcf8IEgKaneNDE1ABP075E3kq4Gqx25yK1iEs9DzvBXHVT6ooQOBb0a6P1coRV
         v9L7TZef+joM3blbEH7MpD68dfEmJJ86ekruSyhU0xj3Q3TJxW0BKfd7zmzS+WE2VQ40
         I8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784137314; x=1784742114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDRO6QnIuhEalRt5fJnXrzp5+6VFXuv7uQsJZiUJYuI=;
        b=HW3c+9nrHzFKLPPMjFd6Rc4DcnBqa4fUTnju9OOfA/NrsDSnZQJ5AE83jbQYM507p3
         w35JGdMWDY1Iv6xm1xx3OBOFSGrA7W8m2eTTMcd2/UYIDGZ9uAr8hm8W8fhIi+CbocCo
         DJVfc8sKPuk8AfAMqo69HoQLQX0Gv8TsFw1SqH6zLZxvbRWC9eQKaH7Dfrle6qxtSMEn
         0mxjy6YG4Qn+BpdxwyxiUG7HAJWiCB1lHMYTu3F82imTAU2bzveJLtfEyyzwu6o+Jap3
         X/BzZWlksg1JKNEK8cZEcy1JX8IJuwtQrGzVNxdbfBh/5iffhlhKDsSE+KUqUb3AUHFk
         iNcA==
X-Forwarded-Encrypted: i=1; AHgh+Rp65dhMGxc2bv5nhQbbKvNhG/3Rp/9aHwZmm8zDK0PBDO68699R1MDjZkuFrSKOpJ0kxeihoc/gWU9GPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH94aTXXhEeoDdA95AEjw8bdYrc2Hq/zdk5J8elcHNHqkklMnu
	oy+N5evYGu6hhxOmhMP4niYEsUzdUsa6n9P1LTAx1uuDDWoc0pDk90/vf0LsbAfB+lw=
X-Gm-Gg: AfdE7cmbLWylakLmYHVpe3P/FA4OIWqvlJsrlxPvkzNx6FpFPDXFUC7vp12m2VYNnga
	hkFa6VRnl/86vuwQHyuliI4nGex0VaZ6niV8sYR0yNKCn8sCmZp8PZnT8fKbo44/WhwKfoB/4eu
	f+bgeGz0HM5PTh0hw8EJ9tXqkEpAH6uRMaYTHz5XhUH6uyLUcbxmjJ7SBtqyhtXzgmw9RPkDRqk
	FEBH0VDUBZoJCRv4tkGohtnVi3BsD7rI+GwCMFLfrAGO4y7T4/2BTDSEdklBo8YHwrQ87C/liCB
	kbs4aVj97mk3S0X2RlGEtSuGEob9vdc+sYcVgTLPXhP7Ex+Gk3CGfGJVNgD0JIPZD2aoWAaFm6+
	HCYserC8Ft/CRyOdNOpYRE3Kp4RMmjy/mEGED8w6bwHUjJz+z+qL9Eo8HBor5
X-Received: by 2002:a05:6214:3284:b0:8f0:448c:f9db with SMTP id 6a1803df08f44-9074c73bac7mr82792716d6.19.1784137314423;
        Wed, 15 Jul 2026 10:41:54 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd5bbac2asm199815136d6.21.2026.07.15.10.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:41:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wk3cH-00000000i1c-0sGw;
	Wed, 15 Jul 2026 14:41:53 -0300
Date: Wed, 15 Jul 2026 14:41:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>, bpf <bpf@vger.kernel.org>,
	Chris Mason <clm@meta.com>, Christian Brauner <brauner@kernel.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260715174153.GB3846105@ziepe.ca>
References: <20260710074528.5a6e4457@foz.lan>
 <20260710083845.23c753ca@foz.lan>
 <87wlv2jq4t.fsf@linux.dev>
 <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan>
 <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <00a244f8-5be6-4ee7-b5b1-e4cbdcd4fc77@linux.dev>
 <20260715163921.GH1778116@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715163921.GH1778116@killaraus.ideasonboard.com>

On Wed, Jul 15, 2026 at 07:39:21PM +0300, Laurent Pinchart wrote:
> > Yes, assessing whether AI report is "real" is work, but it's not
> > reasonable to push this work on already overwhelmed maintainers. And
> > if AI is wrong, again it's the job of the author to convince the
> > maintainers it's wrong.
> 
> We disagree on this as well. This would force contributors to constantly
> justify their value against a machine that is known to produce a
> non-negligible quantity of nonsense. Furthermore, if those generative AI
> tools are as good as their supporters claim, the time they free for
> maintainers should outweight the need workload to triage the comments.

I feel Sashiko and this whole AI world has created alot more work. It
is not saving time at all. Now I have to go and read every Sashiko
report to see if there is something important that normal review
missed. I have fix all the drive by 'this is already broken' stuff it
finds. We get way more patches than we did before. Now *everything*
has to be looked at more skeptically if came from some AI slop. I get
crazy real security reports that need special hand holding now that we
never got before.

Even on the submitting side now I have to run patches through all
kinds of AI tools to have a solid chance to navigate the new guantlet
upstream.

We aren't saving time, or creating less work. My hope is we are
creating better quality, higher security and less bugs.

Jason
