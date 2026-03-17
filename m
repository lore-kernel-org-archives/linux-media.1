Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1663145355
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745730; cv=none; b=GRbCqkbkUNH9HDwXbiYR3mnbNV4UpkJhDTvsKfABOQ0z6SD93dOA/Sn7tGLC/6Ua3zuib2Sr+IvAxtF9Fu5lyc5J2xW2FnftAjuAsJnzcEjaZDW6RwZJdbI5x+ToQ3HTZxoVl8CMyHTd7S5RgMZWEoeUWGNk2Hrh4dXjM08wgMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745730; c=relaxed/simple;
	bh=a/z+ir4CCAdzW6n0Dh6ju0edd4abjM0jYTqUb6wgxuA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dXMP/L9XffgC9Pz8y1XSv7HBrUwF0l/2KUHDgKAIQY3D08p5IxtUq0Xzo5oNWhn9DZs/02zLdct+gcUxRLUyGmdugJbEQeXNtu6h8vUIz/u/kqoohFkQadpQmqC605XuRzuo/titd9nM6z4mdLVXfgJV1QpYdzEfDwXJG/Idf6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUy0lpUF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUy0lpUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8283FC4CEF7;
	Tue, 17 Mar 2026 11:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773745730;
	bh=a/z+ir4CCAdzW6n0Dh6ju0edd4abjM0jYTqUb6wgxuA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=dUy0lpUFPkhiO4j3A08x2nUrYbT/vGAfYRKAla5HBDNX7hds/A4VChIpz5wO3l98h
	 Hovp4oPspAHv4DSfoXl87OD7peYlNTHjER06lA8Zfha5V+UqY+04JUR1Rw/gcKdIr7
	 98iy3IPS+XNMkkarlXgnqQz9W1K8QQ6s9zZOHFDIKKxyH5Kgc7V0tB9x/ZdgtW9WWm
	 fsAItthbZBwRWOBOqLc2GqtoR3JuciYDCXKeb5gMnJLhosgQ1ePRlAiyzDu7zAc+/W
	 MFwOUlp0/gOCgEf1FvNaAVus2mtUGkcoYqsbwEnf8EKBIb/1HeaAY6P+7nVldYEToQ
	 f3Oclnskzw52A==
Message-ID: <f55fdcbf-797e-47fe-865e-27dad0c3545c@kernel.org>
Date: Tue, 17 Mar 2026 12:08:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] [v4l-utils, v2] libdvbv5: modify T2 delivery system
 descriptor
To: Martin Vallevand <mvallevand@gmail.com>, linux-media@vger.kernel.org
Cc: Martin Vallevand <r3o2c7fi@duck.com>
References: <20260102235048.1596-1-r3o2c7fi@duck.com>
Content-Language: en-US, nl
In-Reply-To: <20260102235048.1596-1-r3o2c7fi@duck.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Martin,

Apologies for the delay. It's been busy and I haven't had the time to go
through all pending v4l-utils patches until today...

On 03/01/2026 00:50, Martin Vallevand wrote:
> ETSI EN 300 468 6.4.4.3 specifies the frequency loop length in the T2
> delivery system descriptor in bytes but libdvbv5 populates  it as the
> number of frequencies in the descriptor.
> 
> This change ensures that the byte length is correctly converted
> to the frequency count, preventing potential memory corruption
> and buffer overflows.

I need a Signed-off-by line from you before I can merge this.

Just reply with your Sob and I'll merge the patch, since it looks good
otherwise.

Make sure you use the same email address in your Sob as your 'From' email,
they should match.

Thank you!

	Hans

> ---
>  lib/libdvbv5/descriptors/desc_t2_delivery.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/libdvbv5/descriptors/desc_t2_delivery.c b/lib/libdvbv5/descriptors/desc_t2_delivery.c
> index f88718d350db..5d245cc973c5 100644
> --- a/lib/libdvbv5/descriptors/desc_t2_delivery.c
> +++ b/lib/libdvbv5/descriptors/desc_t2_delivery.c
> @@ -76,7 +76,7 @@ int dvb_desc_t2_delivery_init(struct dvb_v5_fe_parms *parms,
>  		p += sizeof(uint16_t);
> 
>  		if (d->tfs_flag) {
> -			d->cell[d->num_cell].num_freqs = *p;
> +			d->cell[d->num_cell].num_freqs = *p / sizeof(*d->centre_frequency);
>  			p++;
>  		}
>  		else
> --
> 2.50.1.windows.1
> 

