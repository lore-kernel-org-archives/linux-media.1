Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254045;
	b=ZMTtyyPCejE3Y8nAe2iUcV+hUNjCSZF1FEMH50qOuMhu8ctscq1zU6QgIz4DvreFJfyi
	 GjxI81jWpDZqjNQWHFcALs0OELABjcn15yTFKyg0hDsn5Hv/Q/Y3D2WNF//Xy+tkYw1XH
	 28rcMqS09URmZddVMQG2tM5Kx7rQYQCMUXQluz9z8vet6/ZRrYUXgaE+J9PlKrEipiyAO
	 I7j04Z0V9bF/ghlkMiJEakEsAVYWNfOPcGd/k6nR534OmxJuqOQ9beWyc3cB3GVJ4fe5h
	 vpNViL1yMq35OpvidyIe4nZl0vu9qi9kKWUiVTE7V4WnEWZ+1l4CnEn2/wyRd+Rz/Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LvIr1VbcR88AmSo6q8l/U1RONWTkl4N/HGRhgSELxqo=;
	b=u+hPmV0XQ9ND4kQ0IT7KiZO4sHqk5Jxl5AdFVLQvzbdg4Bmp2sdP1g2piou7FifoKB+a
	 9JuEyOZkHiWT3ZiBUZfiKadiidg9Lw4BNgd2VnMzTYZU+F/+Is3T5CiGWuR0vnYB1nnG2
	 Vmwkrm9SKThWDpPItogx4GNK1xaD7e+CUZqk6bgcbuoG/SA4El7YBpSEBruowrT+uYawP
	 UMRkK5/nx9u3DuLThiNzo3EpNEc8sN44YTcHZkCrbZfJSwEKDxXDygc/1chsKxBACwE4o
	 GVxHeHydAGXixf4ov72/5iP4u7uKU6E0kNAeewDAQGqsEJNyCNe+ISPDpfSDyc5/eNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vU2RbX1K;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CB860A2603
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 19:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59CB860A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vU2RbX1K
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso86480a91.2
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 11:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254044; x=1794858844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvIr1VbcR88AmSo6q8l/U1RONWTkl4N/HGRhgSELxqo=;
        b=vU2RbX1KNB++JRS8PSAZh4kT9w9Owg+rjol4q5qGNZTgT9AqxmmgP3iLx6IOOIHbbj
         o5RlkayUmRlWx6cnrnbBamZgM8Tmv//ZnZ7Gip2MPZy7AJchFyOwLUdrjNUKWtbXIIz3
         Xtf3AA5/8faWZKm2ExNFgFl8YQc4wSPLkDgh0XvF15DV2fOmh5sIMiv2eMuFTh4U6ECj
         qycNtxv7xy2HitKfxZQWmO6GPeup/o45hhDBBBMSs31Ep2DplyOYhVJ3Gw6xnYRrnwM8
         dpakWMX1xmVb4EchONT4hXSkkfjg4VGCsfzI+TWXPcA4y4bragEF5Y2OTVs3zdySs6kx
         yLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254044; x=1794858844;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvIr1VbcR88AmSo6q8l/U1RONWTkl4N/HGRhgSELxqo=;
        b=cjMV3t524Dc9l6Qb2VyKGwW6UcCDwrQUJuE8vL6Xkf/UkuXSPjhEk01lRzdfI5J18X
         axiWfqp0gIBJhsHuoUbgssf2EjqL4GZvrUIb3NSTETyUGxGqT0nNFmWTX5LB4Xh6bGd6
         zlA1QHC8AhD+25We1fknfPXTgRztYBP4v+vIY8+yeiv8G2e/0eP52uDIludXxPil5mJ4
         RZ4y+KckBjHezydH5+h8o49iUCK9/GYRDXL7cl9KLQlI7VxAKuZCFPXH6XSw0xC9MvJA
         wvt+3ZedxLSGdx0Gn51DHdHdrwpKIyhByQqGkLujkxSI/OROUaoMM7QxRcP3UAN6kJQR
         PbNQ==
X-Forwarded-Encrypted: i=1; AL+hErHVfUBFVCTVp1DX3jIcFwRv5JaNUFQKtxcvH3LKEcqHmPo352XXGWqJRJllfWYJCirI/tCPBbuLnNHyVA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1wzVXrNUyD21Nn3zL1E/r+95WUy2xwj1UHHglQGwIJgEB6Ecl
	vWGQvK9eeMru2CelkYpdFA0uUMSZwlNUAysGnhn7qQCISdjGBSPYDS1z
X-Gm-Gg: AYBFou21pIbQJ2yqiRuwCevubhyGaIhP4NwgFayTM6p0+7a6ys1dBqmxFECeWLsaRrT
	Fg8zAvU7NBbBVX5+LHOIZi32kzI10wnD0DqyTITLK5HvXuiXqs1B3XBme73h46AJloFYjgW0+6A
	9SI/bU/Weqk9Txoks0XKcLKIpNat6+EsZ7+rvUpMDaU7qRHHJdrQ7nLrnIniSupCCDaFArSEPpB
	5GLQ7Qv6egbw1S/+K/h+OcRTMTArL9Vd2xH+CQFNZ5fj7MWq8QVKFiK1WTc6apEsHu/01tu88RL
	0FAVv/uJHm0FjmHt1eGKpvVZmvy/LCmU4htFvtkrqhRFv+y6CGoGk0y5yADMO4dOG0iRb7+yWL/
	tM/J3twFgW9u0hSA2J+mGrgd9I14WTJIvdebeIQTCxPkYJs+FyMvYYr57dcKbZry6Bq9HezRkGf
	itAnl/R4r16NxVakgF7SMwJ+yq3va895lDYWpWeeYBC3/FAbTZ1TtK5PxsWx4dAYOrB76tVMmMv
	fM9kd7nFL8QdJklq1v7FixDdzUEuhbHF95OMSD9p8qYQzm7CRVanTLaRgmMYEZyfIWU8fBvGBTt
	RYOx7EUKU9yl037g7NbP6FXtfszHLCffrkn3Zdpf/sM1TzMT3BjOtku0cg==
X-Received: by 2002:a17:90b:3c09:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3b166add45fmr1297126a91.0.1794254043528;
        Mon, 09 Nov 2026 11:54:03 -0800 (PST)
Received: from FAIZEL-KB ([2001:569:52f5:4b00:4b92:5a54:3d6f:1e5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1690f4733sm134974a91.3.2026.11.09.11.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:54:02 -0800 (PST)
Date: Mon, 9 Nov 2026 12:54:00 -0700
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org, 
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH 1/2] media: rockchip: rkcif: Filter enumerated formats by
 media bus code
Message-ID: <7lkixkkeumy7l32usxweltclro5tqhgiio6xjyiyx45jnsq3lz@dx43ee4u6ffq>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-2-faizel.kb@gmail.com>
 <avG782VCMTWTNax0@mdjait-mobl>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <avG782VCMTWTNax0@mdjait-mobl>

Hi Mehdi,

On Mon, Nov 09, 2026 at 01:27:34PM +0100, Mehdi Djait wrote:

>> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
>> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
>> @@ -395,13 +395,20 @@ static int rkcif_stream_enum_formats(struct file *file, void *priv,
>>  				     struct v4l2_fmtdesc *f)
>>  {
>>  	struct rkcif_stream *stream = video_drvdata(file);
>> +	unsigned int i, n = 0;
>>
>> -	if (f->index >= stream->out_fmts_num)
>> -		return -EINVAL;
>> +	for (i = 0; i < stream->out_fmts_num; i++) {
>> +		if (f->mbus_code &&
>> +		    stream->out_fmts[i].mbus_code != f->mbus_code)
>
>what about dvp capture. The dvp_out_fmts[] does not have the mbus_code
>set.
>

Thanks for the review. Yes, the DVP case is missing. How about only   
filtering the formats that have a media bus code, so DVP behaves as
before (see the change).

        const struct rkcif_output_fmt *fmt = &stream->out_fmts[i];

        if (f->mbus_code && fmt->mbus_code &&
            fmt->mbus_code != f->mbus_code)
                continue;

I don't have DVP hardware to test with. I can submit a v2 if that's ok.

Regards,
Faizel


