Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80170381AF9
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 13:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780233892; cv=none; b=irRzyCCfFnBP5xXH+dLTBtEikPGg0/HkLwstjzsr/UZsZz2EJQAZ5xaV9Zprk0qGBsKPkWC64qMmVbD8sN8N4nHxCJsK476WvO20KJs+45eF1WsFfmuzIN5SM2V9YzViXtGwirRQ8x3Vp6SuoAUlgoID/3dg9A/BPwRu3fh8YYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780233892; c=relaxed/simple;
	bh=TdETBg2hyhCznrcUcIVxpAcmvh+vIqajiWRRBmiWAfo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gfxzQGm4INUxyDx9ztI328tNobc636wstL/vmxKN+ht+0NWq6+BXf4EALUFV5C9JefqiAcH2tTF/eROKpvytGQh5JIln0R2iZUPvIXvXDPC7Sycsn88n8Vm4byDhGf2/uI4hLrSVpLRnCkvqVunP4EfXfB+c+i3sTv1zMA89e1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BA9XIWEt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BA9XIWEt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF951F00893;
	Sun, 31 May 2026 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780233891;
	bh=hCr2d+LeXcOBU2hHTT5r0zIliCEBPxi/gD3LyVnl8UY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=BA9XIWEtuXqg6LJZWE+Q/xOaOfz3QqvCYClNR2AUI4DoRNwyBp21nwy1aDwJ0frGd
	 XU8OpuFfIpMkLyTvnc7P9jVhod9zeyedZ0Su0cnKEGs1B00a4SI8n6NjtPAKyqe5gK
	 VAtPSZXikgU5oluwacnKSFEJTRQWY8lyf19WWmuabMmsXCIeA1w36OtuTlwgKirYzn
	 VDEEsIPT53l+EGd5YWfd1fLjzrB0Dcei7EAp96ZCJRQyQCpvJpMujaw5pOsc7FUj3Y
	 WMchIqet7W+5NEnV3PMtMGHcF3KcMQU4EXGfqlsqFG45P7jQlDQNQOQvHHqjdlq3LE
	 uCFsc9Z0dG3+Q==
Message-ID: <2d1e7167-2cf4-4998-9005-5d18a45c0144@kernel.org>
Date: Sun, 31 May 2026 15:24:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: media-comitters next vs fixes trees
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-media@vger.kernel.org, media-committers@linuxtv.org
Cc: Bryan O'Donoghue <bod@kernel.org>
References: <CAO9ioeW5mv9bQjKbd3KOx6V4GB2xKgmDcLrbLowc=j0agwWMag@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAO9ioeW5mv9bQjKbd3KOx6V4GB2xKgmDcLrbLowc=j0agwWMag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 31/05/2026 11:13, Dmitry Baryshkov wrote:
> Hi,
> 
> Is there any current rule or plan about submerging the fixes branch of
> media-comitters to the enxt branch? For example, I have several
> patchsets which apply perfectly to the linux-next, but fail to apply
> (and function correctly) on top of media-comitters/next because it
> depends on the commits which are only a part of -fixes.
> 

By default we (and with 'we' I mean Mauro and myself as media maintainers) do
not merge the patches in the fixes branch into the next branch, unless we are
asked to.

Most of the time the fixes are independent of work in the -next branch, so we
do this only if there is a good reason for it.

It's a bit late in the cycle to do something like that, though. In the meantime,
just mention in your cover letter that the series depends on patches in the
-fixes branch.

Regards,

	Hans
