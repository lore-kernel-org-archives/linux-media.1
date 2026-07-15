Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285892931C2;
	Wed, 15 Jul 2026 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109654; cv=none; b=JkpZHFWn/aO1/okn2ZouC/EKJtoDBH/mXOf/r7nIy3IZVmuT+aIGb2Sq/F5nJrAWUbT1KwI4242OfVPMbtcoDHo4doSF+gho6x8Fqp91JZW82lmEAnNYirMyY9X1IKN5CptphDZx3Ur3YMKXrJPSqao6oXc/IRE0Y0G3YRULDKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109654; c=relaxed/simple;
	bh=FzYK9QBt5GoCU5ivUuGC6bBJW/oKmjeLkYYoQsNThss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WeXyOq0qeckD9SqWtmzJ1SNV+jMzx7OJrZVaAWcvZvlv1QUUk5/Bj46QgPlEXk0Z3blRW5J3WPp5vgSuF8ku/Iva3+H/9kFWvNbrCagLGLeYXVH4ig4K2q/nAUXg5j0k+PEWVMV7gVXQjEcfJ7wahRroQN47zCkIhZEre7NWp8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxICMSi5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxICMSi5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F261F000E9;
	Wed, 15 Jul 2026 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784109652;
	bh=VC01daqvSBQ0L3vAI4KvNrdPwbGLWa5Dj52SJ44ZAa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mxICMSi5AEs0IZ5zb2fizRpP/iLAT9s5sm/uOqpv2qLnetG1Dt5VIIFSXn6Fkt9ri
	 llNOtXAT5F+qRj7kwH+M4pOMjj8pe3YoO2X00zdqJ4Jzjjg3f5GpjaTgzTK4kIk+Dq
	 IbnH9UjdW2JtI/hQqSCOQqYjpnLYWbit8r0QC5y3BNE20copHUvGdAt3GHzEF91zAQ
	 0gbSv6AWGbmjudMdIrs6IA57pLKCEp9OmWapbHPwVbelnTc5jvkr8DcFJhNLMsCZ/I
	 Q8HQS1dUXOu35ymRf8tXFnwyJnlBlQgnidrfygQ098WAU5Dcv3gJP8YYvltDpnRq71
	 1uaDfspCUb8RQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wjwQ6-00000005uvP-2hXm;
	Wed, 15 Jul 2026 12:00:50 +0200
Date: Wed, 15 Jul 2026 12:00:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Lei Huang <huanglei814@163.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: Re: [PATCH v2 1/2] media: s2255: Rename CamelCase goto labels to
 snake_case
Message-ID: <aldaUlUq8bGDsJgT@hovoldconsulting.com>
References: <20260715092947.772768-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715092947.772768-1-huanglei814@163.com>

On Wed, Jul 15, 2026 at 05:29:46PM +0800, Lei Huang wrote:
> From: Lei Huang <huanglei@kylinos.cn>
> 
> Rename the error-path goto labels in s2255_probe() from CamelCase to
> snake_case to comply with the Linux kernel coding style:
> 
>   errorBOARDINIT -> err_boardinit
>   errorFWMARKER  -> err_fwmarker
>   errorREQFW     -> err_reqfw
>   errorFWDATA2   -> err_fwdata2
>   errorFWURB     -> err_fwurb
>   errorEP        -> err_ep
>   errorUDEV      -> err_udev
>   errorFWDATA1   -> err_fwdata1
> 
> No functional changes; all label definitions and goto references are
> updated consistently.
> 
> Signed-off-by: Lei Huang <huanglei@kylinos.cn>

This looks ok, but the fix should go before the cleanup (e.g. to
facilitate backporting).

Also, always include a changelog (in a coverletter) when updating a
series.

Johan
