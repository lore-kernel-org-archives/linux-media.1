Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F32737106A;
	Fri, 22 May 2026 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779474222; cv=none; b=QzKG1s9T0vVhVGAvxjqP80NyHMIXWC3gVZjMjrKAQKStvuV6iDUJXa8+bq1MAfIXtANN8PQ1Squ3eeiqYZ6+vMfd0rx3jIbuKomZZvhLGTdSqZLHNJDUtEsGjlQ/eZOxz9S/TWMXDGQImKLgAnrcyfO6j4vpMBcvA3A/WJ/9fRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779474222; c=relaxed/simple;
	bh=x5K1ZgA9TFn4twCK4fNkAG2xUy4S3ECxclUvXL6nQJs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CfvNMiqJ0Gjy/wA+xylxYZQADzhD01+Wlve3d4F8Kq3zd3/HOeFqa34WkXwqrCzw0Z1V/Rrb3o5hwQ/wl+1zaHJKRBylHG+BE+IiV+L6tSqOjx+fay5ojx7LQB+kT0hz3tp4P0rz+uWC72Xyav+Gwxx7RLpJhUGRYhx4h0qDb9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EITn78Md; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EITn78Md"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CF11F000E9;
	Fri, 22 May 2026 18:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779474220;
	bh=kG8vAWSrDwkpNVpMVBPe4p6aRZZUD0U0KgX3vvXQM1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EITn78MdI7Ep5DjkQF6FEoDdPf8vs90xfPf1xjwkMpome9Kg3lJeI9Tl05aWSbjZM
	 z6uQwHR+wW7pauvJ6hdpkydyrVXvXu51vyTvJbjHhKYxQ3p7XNFdkZP3XJ7yPfZwFY
	 uiHHeQJqJJOSuTEM+1ZnoJi99UUZxOnPCWSo6SKgvr6zNzIawxRhjt8VhoQJaxjIFb
	 zBfJYvukMvr/zoFBu+tjUoX72ji/qHjyFPWslCZq8N+++U1pCGpjA8pEKX4/ACpSBC
	 FGFJm6k1yAOJugx5nXBdQQ46kT8e8GH92cX3kwJSpHGE9gTfj9u3O6cUcXQnFc6yQc
	 UQ6e10B1StQ6g==
Date: Fri, 22 May 2026 20:23:36 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, hansg@kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: AtomISP tree for Linux Next
Message-ID: <20260522202336.216559c0@foz.lan>
In-Reply-To: <62b17869-008e-431b-a450-1b2e95111734@sirena.org.uk>
References: <aeop-rkoHOgF2OgQ@ashevche-desk.local>
	<132d71a4-25d7-48b5-9705-0e7d7dfeef20@sirena.org.uk>
	<aeskxK7GODqMUNsH@ashevche-desk.local>
	<ag_-6fqLzpvqNKw7@kekkonen.localdomain>
	<62b17869-008e-431b-a450-1b2e95111734@sirena.org.uk>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 22 May 2026 13:10:00 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Fri, May 22, 2026 at 09:59:53AM +0300, Sakari Ailus wrote:
> 
> > I guess I could push patches to the atomisp branch after running them
> > through Media CI. But I'm not sure it's really worth it: the long backlog
> > of patches is now largely gone and the same fixes or cleanups can be only
> > merged once anyway. So would you expect the flow to still continue at a
> > similar level? There's a limit to which degree this driver can be improved
> > with such cleanups.  
> 
> FWIW so long as they don't cause conflicts all the time the marginal
> cost of including a tree is effectively nothing.

Sakari,

Patches committed at media-committers will appear at -next once they
reach media-pending (which, except if there are any sync issues, it
happens in a question of minutes). Just remind that we don't merge
patches for -next after -rc6 (except fixes, in which case you need
to warn me about that). 

If nothing have changed, linux-next also has a similar policy of not
wanting patches that won't be merged for the next Kernel cycle,
which means that media patches after -rc6 would also wait for the
next -rc1 to be merged on a branch that goes to linux-next.

So, personally, I don't see any value on linux-next picking directly
from your atomisp tree, but that's up to you to decide.

Thanks,
Mauro
