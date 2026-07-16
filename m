Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBAC3B2D0A
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 22:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784241058; cv=none; b=iRDpfTVRrYeRbBV3+zmKJ7NICVP/yhpaWYW//aWrSu0Z4P8WbDMIoQ7UZ8e8qV5xr6OaHuTmrkxbQZY5vbaVIJ9FD87o1XcEOdVUE7OHcr9lZw7jObhmDsUnjP4G/fCAuyAOZ3qQ5bbQOyHriIttljjBoNIex8THda6LcKSZqOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784241058; c=relaxed/simple;
	bh=ot1GNo1gVRyZJWP8njVcEz1T81CPSxx4Z/T3i2f4BGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFRLelEh8/2bige29CUyV71fdokHVvxlXNTIRT1PXQkMprpMVX3asWSc9C0etN5anRO9d+pNUZ/pgLzgxXloP6TFvzZrfdWahbXhfeUR0y2ynGX0p2RIreSabRRWfnrR/EEhahCgKW91VV8ithBJFVJwP8zpBrblqgw2gN22xsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4IVdNB5; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4IVdNB5"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8487b7b4066so7425701b3a.1
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 15:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784241056; x=1784845856; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jnQqVHT9mIlQjz4b13IFWBpUZI0AFofijg1xz6XP/Fs=;
        b=o4IVdNB5cHZDi+biVvBttG1Zw0Vu+InskeepJSSBxtDHg5MMzvKpMNgQ5zNk8852r/
         pjDZTg2slp+9q23Kho1lK+cOvr76zuJcr/Ys7yY0Iqm3ljCbkDeGE0aeOjMqnIf6vhJ6
         9rARmYehh5KaW36z0TdnShite12LHFAvCC4VsUQ/yeZAhjZjOHvPO/nC9UDrHsy4UxlU
         8B2Ye0tmn/DfW1gN056pbObzCUsOTqtRZBYZhixcveyF4R0G7gJCuAjiAl2M3I4HQ1Uo
         0ub+5ovo69NWiDUJCNxEqxYIfXskeCiovyeT8M1tVhzNeWdY1GSg3wjiOddxYxxfq/9x
         EWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784241056; x=1784845856;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jnQqVHT9mIlQjz4b13IFWBpUZI0AFofijg1xz6XP/Fs=;
        b=qUB8P+wrpesDekT+wFtXA9+TXJg6oTksbq2wyiBUieIY/9ozr1LjKVr1Lm9fL43QvC
         LOL8ri4MNigdpw5+jWNyoE1Wpz3GHOOLEN/0AeH2pE63EqfRO28vEe0ws5N1Z/C1drfC
         Ug8C4halc91Gn+rXDWTsP3OOpVNEdyhJRD6MWDCKXd+MrjTm+ONERMvpfY2fbmqq9kQo
         ojy8lbMuvtbWmgimsc6CfXmJ8de2TOwKcFs4LkpnxzxZkh+cyLxucAIeO07neRDJf0yu
         eCLJy5BBlIEUIDz/W3WjhA+8zUp3IlAdtwiXoqoDi4dB/IF2LNYBB/3+Ouy+08CnpRNz
         6boA==
X-Forwarded-Encrypted: i=1; AHgh+RoLIDoHSX/GOGio5bchKHlpbo6cVi/22aRmskJMCATlEkTsFF5ijFvM8/FiX8lnTcKRCtWUDkt3wA2Gvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynWHm83EDmPMboJzyD2KGA2I9wZaBmowBszn5ofKLRQi78YIuC
	NnJTwKur9gCjCb2I6zf7L6CIbcK7kTOCB9HC6lCJ5Qf0F7/6+VaNv2Lb
X-Gm-Gg: AfdE7cm54ys9mek2wHoVx0J9vuzdb3DycCm5eN4pEwYe3gmxfMjqoDMRfMb6/IEpVAt
	qUy2xzyDm/bglllUe/BUSPECEL1fYSO7k4e7fFKL/or6ljkzV+LSpt2Ymw54IsdXsYa49dfSJm3
	nZyKLWV6L9JQcNt4fpNeFVVT2HbYvnDYXwFCJJv9SwOojzsBrYTuZqLE4G+rzC/MavEwhw0jqPJ
	GmyrvfkKCS/7LUsbgK4BLhOrynN08W9WWJqHSBf9ZuAEMOQGEy+GMPbd64T5JrclDXakJ0Wlv2n
	3B+dnbXplh/9At43iS9UT1vTW/NC4CeRN6royZwJ4YBU6w/MqoSr3TP7uJXkDx/260fI/q4K07a
	+SBXbRwWQ6e/V+yCTRnn9Fi82taQqyt8Egbf0xoTsgQNMGjnGwix0Wd5twUgvLi+xczbf/blyek
	X0De8gXyEVZyXVz9eJP4Wy1ZZ9IcPNBAifWW5tKb8muvw=
X-Received: by 2002:a05:6a21:7103:b0:398:837a:7af0 with SMTP id adf61e73a8af0-3c36c1e6ac4mr9446805637.30.1784241055983;
        Thu, 16 Jul 2026 15:30:55 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:38ea:b937:53f6:928c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d444sm113394eec.6.2026.07.16.15.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 15:30:55 -0700 (PDT)
Date: Thu, 16 Jul 2026 15:30:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Theodore Tso <tytso@mit.edu>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Derek Barbosa <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>, 
	bpf <bpf@vger.kernel.org>, Chris Mason <clm@meta.com>, 
	Christian Brauner <brauner@kernel.org>, Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <allajcbLlV5xwfXh@google.com>
References: <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <00a244f8-5be6-4ee7-b5b1-e4cbdcd4fc77@linux.dev>
 <20260715163921.GH1778116@killaraus.ideasonboard.com>
 <153db0fa-65ac-49de-9bf5-456c9639954c@linux.dev>
 <20260715190654.GK1778116@killaraus.ideasonboard.com>
 <alfwOgVRgUJYOGtU@mit.edu>
 <ef9f77c613a05c5745941587099eeb4f159d5e31.camel@ndufresne.ca>
 <alhMB7vGodoewjcz@mit.edu>
 <cd791ba9f1819528a9a964ae2ae3833c8e6c4b87.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd791ba9f1819528a9a964ae2ae3833c8e6c4b87.camel@ndufresne.ca>

On Thu, Jul 16, 2026 at 04:54:37PM -0400, Nicolas Dufresne wrote:
> Le mercredi 15 juillet 2026 à 23:53 -0400, Theodore Tso a écrit :
> > On Wed, Jul 15, 2026 at 11:00:54PM -0500, Nicolas Dufresne wrote:
> > > In V4L2 m2m notably, there is a "job" in the background, which allow
> > > to safely (at least this is the theory) chain up work, and
> > > synchronize against pending work. But Sashiko (and other AI) seems
> > > to not get it and state with confidence and long explanation that
> > > the drivers are racy and should do X/Y/Z more on top (and never
> > > blames the framework).
> > 
> > Is there actually a race which is allowed by the framework?  Or is
> > Sashiko's proposed race actually not possible?
> 
> Not that I'm aware of, as long as the driver follow the conventions. A typical
> occurrence of this is when Sashiko suggest that you should do an extra worker
> cancel after streamoff. The framework already ensure, through a job wait
> mechanism, that there is no more active tasks. This allow chaining this work
> across workers, and one really done with the task, the driver will call a
> function to finish the job.
> 
> Though, AI is also fed with code using the framework, but not the jobs. Venus
> and Iris from Qualcomm just leave the job running, and manually tear down and
> finish the job on streamoff. So when AI use that as example (or thinking model),
> they conclude defensive coding is needed. I bet that if Qualcomm Iris/Venus
> developer where to review other m2m they would provide similar reviews. But they
> will likely add words that show a certain level of uncertainty, very unlike
> Sashiko today.
> 
> What happens is that developers endup producing defensive code for cases that
> will never occur, but it can go as far as refactoring and putting in place extra
> mechanism that are simply duplicate of the existing framework. So we receive
> more complex code, with convincing comment that does not reflect any real-life
> scenarios.
> 
> Now its not a great mechanism, since its easy to "finish the job" and keep
> working, which can make the driver code run concurrently with a device_run()
> from another thread. And for multi-core drivers, its easy to forget that the
> framework does not protect anything concurrent inside your driver.
> 
> Sashiko is just not doing the teaching that is needed for new contributors, or
> for experienced developers handling slightly different type of HW with this
> "problematic" framework.

So I think here you need to teach Sashiko a bit. Submit a patch to
https://github.com/masoncl/review-prompts that creates
kernel/subsystem/media.md and lists all fine points of the APIs and
common pitfalls that driver writers are often fall into. That will steer
Sashiko away from suggesting hallucinated or impossible to happen
scenarios.

Thanks.

-- 
Dmitry
