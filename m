Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562350;
	b=2dUjOgtT+21RjiIYWmH2xOmr64vjYEhA8W13TzN4QxPZOKP3MkMUMvZn2WE3dk6U+Uw3
	 8VCVcw98eWxBRdeH22eQoHOO4NJXvFtBR7kLqkU/l6U0mPWXtSWO6YIAcQK2DuZJKuWjB
	 I4fiRok+4PcPj+ESUudII4ijLqQ9zM5/HobutplnCwqDRkcs82mrXdThbfnuy5+rhtW42
	 iguxVRHDX9vIgdoS4CoQdt5+9I17HPgLKa3HRsoMZsCO37xvv3VArZ+3MOc7DJnEsbjkq
	 k8qGkJ5iJVltni0YcEjkmyaH8iyjPqs1U7YOICOSPyiLXYwEamkOMUxkFoJfe+bllUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562350;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9U7FKSaGLSK8nETtgI+pBjRFIgQlsHLi2YccyOJLyd4=;
	b=S8x/9nCQweMGv3m7iF28bSGHG420GgKfrUP2zquYCWsHnZWbKIRpEjXfjWPQinocBTAJ
	 9H9YqlSVVDQaoHNdMOOeizeJgP5f1Yx860MM7QyGPWVmAa+orNrwNnts8+tz7DqgurI2f
	 QWdMgkkHOVXz5oT+gP19/oLMNZuELMXLd57WllKGfEjytS/Nf1/TjMlWJu5fzWLHXjMn1
	 qaq1I/VYEjhnSOkeQqRJebeHVgHxIW7zjw5OHyNCWo78zH0voWixUawhYgT/BRaKBSovX
	 ePq+xOZx5Hoql392D1PhaNqX39JuJvKVC5H0jqvWX7Fy1oO8YwRWglN+gokB8JISRVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lYNXfSpo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B002606A321
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 09:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lYNXfSpo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EC31F000C8;
	Fri, 13 Nov 2026 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794562349;
	bh=9U7FKSaGLSK8nETtgI+pBjRFIgQlsHLi2YccyOJLyd4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=lYNXfSpo+bpjK6SLIZG8a4qnXN7PO30pjQW02VpGEoxo/tzx6iDznILz8woxsZAEc
	 kI3NK6fsPnBdvy27YbASBKqliDUv4s5w5ujAePjHODjh0CxTBAjx5T0qlGBIf5zb7F
	 AcPB3tqEEB7fD2ndOWuNLLRQFekgyzxI3u9M3Lv6ZdKOy78K/UHszCMzaI+R/E0d9P
	 1OtRIvClzWDm5zSD81vL/ic4aQxsN13pd22j4B+1zsZs3vjdbNHe2f0Qs+10qLiWE6
	 2Bp2BEEvBt29Cj30PqM8HXyxxr+j4WQsCrsn8gu983URjeB/p95tyH5b/6gMCyhRxQ
	 evCt1/E5OwVhg==
Message-ID: <c84754ce-d1eb-4b0e-9497-0d0133b5719e@kernel.org>
Date: Fri, 13 Nov 2026 10:32:27 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 1/1] MAINTAINERS: ipu6: Change Antti's R: line to M:
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: antti.laakso@linux.intel.com
References: <20261109114657.2262-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20261109114657.2262-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/11/2026 12:46, Sakari Ailus wrote:
> Make Antti a maintainer of the IPU6 driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..e13bca12b6ff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13541,7 +13541,7 @@ F:	drivers/staging/media/ipu3/
>  
>  INTEL IPU6 INPUT SYSTEM DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:	Antti Laakso <antti.laakso@linux.intel.com>
> +M:	Antti Laakso <antti.laakso@linux.intel.com>
>  R:	"Sapre, Sarang" <sarang.sapre@intel.com>
>  R:	Divyamani Tripathi <divyamani.tripathi@intel.com>
>  R:	Manik Bajpai <manik.bajpai@intel.com>
> 

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans
