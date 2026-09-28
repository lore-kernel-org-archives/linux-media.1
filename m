Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA8137C11F
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 08:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583880; cv=none; b=mvno4m7mLDlXQ/V8LRYt8AMIwWLBFeDwOWbRA/8zL6XYF1xocwOdMfxYLLD05gmhZLHyIKN5l3SMqu0v42uFXyWVZO+SKXtL3R5jbUpXwIrhekKjnEfbv19Z+B74coamnFv2TyyBeUMTbQ7VJLZLUrxSIORvYfoVd8+KXIQBNwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583880; c=relaxed/simple;
	bh=Dkb4Ao7WKhSe+Lg12Nr6bCTmPnLI5BAq7v3hAAoj+Zw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=GAHhVt5TQQBbpXOTHlsIOi/Vq/Oau+ohEPCMWwJUrd2xwwv/BpiiiznC62AQ6bmpKPtiaSxl9Cy8HX7lVwji/HJyBvH83cTTqULKjeJJY7NmfmhxfuUC6Ma8eR8ZMwfAcEF//s3zlixVGq8CLcPWXU8RWvUUVA8Hwwk0jP8DN1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXgeuTXz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXgeuTXz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0965F1F000FF;
	Mon, 28 Sep 2026 08:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790583879;
	bh=NhHwpfu9Ku9eBzZEHYzIfKe1lmr+T3ECEhGHL9Uhxq4=;
	h=Date:From:Subject:To:References:In-Reply-To;
	b=NXgeuTXzpYMHRSPNCKbNiGdfWtgxRuGoUe385Bmtbp6f3cFFJjeY3JeEtNzX5CpiP
	 zjiLT519dKdksXjUJK67vIe+ZN3cDquPW5JoLsdk3/MBg7YxKOH+k4C8pIP43Di8NL
	 eLrOcajZTzjvn4YxkY3cN/oCz4lB0RpS/SO8rNLHxdnjYc5UhhRRfp8qEN6aY3XIMD
	 bQ9PxMc74U37jS9pKsmbNyy6J10iVJi+FvpO8Dq4sKDcmgz+txTQesJKg5sRAICIFi
	 TAyeL4iVhMmsoGuVyH/A+PhjYmxUZsDoFsxyzLTCxzLXmpcCQt+LZTphQE0AWf8Roh
	 f/Lx2SQrkdswA==
Message-ID: <0c6c1a8c-b0eb-45ca-b5dd-b5ebfe0dc95f@kernel.org>
Date: Mon, 28 Sep 2026 10:24:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 0/2] edid-decode: correct and complete AMD VSDB
To: Julian Orth <ju.orth@gmail.com>, linux-media@vger.kernel.org
References: <20260925-jorth-amd-2-v1-0-41deccc043f0@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260925-jorth-amd-2-v1-0-41deccc043f0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julian,

Thank you for your work on this!

I just merged these two patches.

Regards,

	Hans

On 25/09/2026 15:46, Julian Orth wrote:
> This completes my work from last year. For your convenience, the diff of
> the EDID database is available here:
> https://github.com/mahkoh/EDID/commit/c5ab164b200f1ad51ed27e6e18246d6459282bfb.diff
> 
> Signed-off-by: Julian Orth <ju.orth@gmail.com>
> ---
> Julian Orth (2):
>       edid-decode: fix incorrect shift
>       edid-decode: correct and complete AMD VSDB
> 
>  utils/edid-decode/parse-cta-block.cpp | 291 ++++++++++++++++++----------------
>  1 file changed, 150 insertions(+), 141 deletions(-)
> ---
> base-commit: f341ed8e3742118a86619e5f499017db2de30d94
> change-id: 20260925-jorth-amd-2-4deb5baeeb26
> 
> Best regards,
> --  
> Julian Orth <ju.orth@gmail.com>
> 
> 

