Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689901;
	b=hTDXHwySCf1zDgEVoDw2+Qgvt4+QuBQyLIlW3m6Mk5GYRyTBappOkmOmylhxM3SfSBAh
	 1n7tICr2yBkhhGXt3FvAnoddjASmLTBACyWsdmXsl1NpixRR2EVFp6gI0yQaOAHGpkOID
	 u7iRxpWzebe0lZhJnFz6dxD5bO+sojdFnLAV9h5d2GVPphUtAL6EGwj+B6SXNsXqNxW+S
	 575G5Qxqz2EQ5YFKKUNCNkaOyJGCTH9Rg/y8Cfj1ieNGDlB8VdWqL5uefnyp+3Hcc5tLW
	 RYPSpWNbvST8GkIP+43x6D10D3LxNrrxwpNFCVMP/l1Lefj/HLAAhhNP9CcJptN9L7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dTzX6/OrqoSYIYFMnL47MVuXS44X2MuyVzOdV4a6oao=;
	b=xGbierdjuFsEBgwljorqwokZWFPnzAfUGSvpIXlwNpiklMd8HsUXhHRZzUsF1a0GkNRM
	 iIUPjI7/z+yBfqVUy8HAFqCK9VAgtYzohIWJMNfgMGd2Fgeeu/r4KaRdcJEBJSG216iHc
	 74myjAp6Worj45U3/BQ8BQFVBf09YdLTQp1x4LV7rIMmVTzs5Q8Iy6HXlKGAfcP96ZLen
	 NBe8hwPNmaOKFNE6aFFHpLJYRNQmvWUfVEquHcmc4n7pKEBBg0Q04XjeBg5TzPnKMYmlS
	 9bSDp5GmyaDmPl4uOYZDVJKGo3N6ro/P3jv0TiwRDX6Ts0Ln7G7o8Ls1BAa1UMwSmVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tR/VI8cP";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACD2606A32D
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 10:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ACD2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tR/VI8cP
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a32576da88so3922207f8f.3
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 02:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795689899; x=1796294699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTzX6/OrqoSYIYFMnL47MVuXS44X2MuyVzOdV4a6oao=;
        b=tR/VI8cPcpG5hymT+T1jcM5A1W7L8XQdJUT+lNdQZXkVX5/qwTisGBB28S9PUlJsJ3
         07xKsPLkA0fzaUCLNWHD6ptTWhEJyZ/YpopYg50jdi4XQiqSpBJEduMI9nMjK3kLW/dc
         SK2nfH7/vFX/59Ji2uVyc0V1+f2jvFsSc+bR5DsewBYNgIFkASD7O2uYPV2xtYditdqh
         08vGmNfJZQeDPhdI+4ijTOI+LRWnffKfBLoVsVB1lfqZ0iTk02RXZm27biW8v74SGE0Q
         1fUak9psa8IkZFIMAsMVsPq5d0hSKpbhVb4lo3tv0klvXAWVqs1YAK7Xoz0HGESm7LTS
         hhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689899; x=1796294699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTzX6/OrqoSYIYFMnL47MVuXS44X2MuyVzOdV4a6oao=;
        b=X+Gu5nv+ZX3JoPp+OYr3DQMPDFphKGdcIEp8K0S1moknK0RHZ8ZFWnsQzHjX9xITdo
         PobRCoWW4H2/5EIElyyWJqQmLMLDGr7tX5QAaBT/nbGcPUnQMnstO7pTgMgoZqIre4M2
         jihWitqjWUGmA/AAPSRo6yBKsLWRQcUy6Fb4Yx4rkoIHrRMGOVrNn4gR/2GXZgCWDgcn
         9X7/sZLnNxitN3g33K/Q+4wOXhHPqQyISrc2s6JOilwKoGwvbua1TEpSluS1VNsJa0Qf
         0KBYEGxZMDvia5Msewinou7HNrogWFCXJmiRgh9Cp4H2JmqDvydjuDPT4NzfjDSfiXCQ
         o+JA==
X-Forwarded-Encrypted: i=1; AL+hErEHPhw5tBAuUbilW/hyj62zav95N7cU6GyrYIsyoy2MbxOyi4hdDwjRByR/iTNi0QH2zpJO3TcxNwciqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/BM2qZ+Wz7V7BSA+3T+mkoWUhtxx69DKW8iaEd5HRGA/679aAP
	Cf4Ek8y33lfFC5TekpAP91Ua8cEW3PccXWxBlHlboTkL6il5zjEZLcPA
X-Gm-Gg: AZFdTZfQQ517j2OjzZUdo+JOHz/ZuCvB2EhCX36AGZ3tlGu810XGMsMNnlsSL9fkm2P
	zHtjaLU1Gi/wl62TEePT/out6b0UP60msfrA8fbBtAY1KxT73OYIfywVp6MGqbm2dQqON3ncyLf
	AMrVh+V2jRd0immgl9uzGtwUXcEJmG7DfCNstLeNHlS01M2pVn4JibLCyjbGPYKWT3Y0gUEeFKl
	9ceBmpjkM4bydBkOA3Ozu2ukWMK8p6VNZZN5dGI9/nBECN6IOHdjkPDNwGx+xBx3JcNWnIQhs5S
	nq+wQtshtwryCWSctTOqT5MF1IU9spqPfkRHEeEOBTQqVNgcSArFh7vA0T/mDCoVHXjzSRer52k
	Vu//iStXnvqA9uX2FfNfmBbsU0iTSj+3eOVjEQozHlg3BFoCnheHL8uj6crMxyQiJnjRHIeVPAk
	DT/dAmmUsxnsHzBppqRHkSzJOAh8d+dBZ7AlizSBKSt47eZtI5whkOLISKeEiLOixc8zWgLV0D/
	FSIAcAHva9UAHpVIpyA+HDG/HqvvlLucQNYTnxAF4TjDV7yd2esqZW5/YhULhcwB9AyoD55f3IB
	WSzUEFL6iYQNFNB190JJBw+jwz1vtiy+ym+AcVb3u/gHmk/SgaDvcvDyIBn+8tMLoP/PzNn3PLQ
	YqnBpqGKxGxaPuCVgUdK4QV4G0lCkcuIxY9xGgKui1nSMkppRxZ5gQlcq/9uu0TcrszlqWbo9cE
	nSUdo=
X-Received: by 2002:a5d:5888:0:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-4abb532ea79mr37997103f8f.29.1795689899355;
        Thu, 26 Nov 2026 02:44:59 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm40898578f8f.2.2026.11.26.02.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:44:58 -0800 (PST)
Message-ID: <0b76171b-7f2e-41d2-8a5c-102dbe4cb85b@gmail.com>
Date: Thu, 26 Nov 2026 10:44:53 +0000
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
Subject: Re: [RFC PATCH v2 0/8] ext4: Add dma-buf read/write support
To: Mengmeng Zhao <mengmeng.zhao@linux.dev>, Anuj Gupta
 <anuj20.g@samsung.com>, Christoph Hellwig <hch@lst.de>,
 Christian Brauner <brauner@kernel.org>
Cc: Anuj Gupta <anuj1072538@gmail.com>, Nitesh Shetty
 <nj.shetty@samsung.com>, Jens Axboe <axboe@kernel.dk>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, Dan Williams <djbw@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Baokun Li <libaokun@linux.alibaba.com>, Ojaswin Mujoo
 <ojaswin@linux.ibm.com>, Ritesh Harjani <ritesh.list@gmail.com>,
 Zhang Yi <yi.zhang@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Li Wang <liwang@kylinos.cn>,
 Mengmeng Zhao <zhaomengmeng@kylinos.cn>
References: <20261113070621.273953-1-mengmeng.zhao@linux.dev>
 <20261120154153.GC28611@lst.de>
 <361c4312-f77b-495f-9ee4-e0b9612b4463@linux.dev>
 <CGME20261124084131epcas5p3098eab1bc134da7aefcc83c646b54a9d@epcas5p3.samsung.com>
 <20261124084025.2101804-1-anuj20.g@samsung.com>
 <3bce3a69-e41c-4683-b1ca-9477dd41a7e0@linux.dev>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <3bce3a69-e41c-4683-b1ca-9477dd41a7e0@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/26/26 01:25, Mengmeng Zhao wrote:
> On 11/24/26 16:40, Anuj Gupta wrote:
>> On Mon, Nov 23, 2026 at 09:51:41AM +0800, Mengmeng Zhao wrote:
>>> Hi Anuj, I'd be happy to help pull our patches together into a single
>>> unified series and send it out for review, if you're okay with that—and
>>> would appreciate your review once it's posted as well. Please let me know how
>>> you'd like to coordinate, or if you have any updates in progress on your
>>> side before I put the series together.
>>
>> Hi Mengmeng,
>>
>> We already have updates in progress on the XFS side.
>>
>> We will consolidate the combined series along with your ext4 work and
>> related patches, keeping your authorship.
>>
>> One more thing that we are looking at combining is the ability to share
>> the registration across files. Pavel had mentioned this earlier in our
>> xfs series [1] and posted a series too [2] which needs some more work.
>>
>> FWIW, we also had ext4 changes, but intentionally started with one
>> filesystem (XFS) so that the common interface could settle first.
>>
>> [1] https://lore.kernel.org/linux-block/4649a20f-aba9-418e-987f-66f21ab24410@gmail.com/
>> [2] https://lore.kernel.org/linux-block/cover.1793751001.git.asml.silence@gmail.com/
> 
> Hi Anuj,
> 
> Sounds good, that makes sense given the ongoing XFS and shared registration
> updates. Thanks for including our ext4 patches and keeping the authorship.
> Feel free to loop me in once you post the combined series—I'd be happy to
> help review and test it.
> 
> I looked at Pavel's patchset as well, and noticed it adds a new f_dma_io_tag
> field to struct file, whereas Christoph and Christian want to avoid bloating
> struct file. Did I miss something, or do you have a different approach in mind
> to avoid adding fields to struct file?

I'll resend it later, how to store the tag is the least interesting
part, it can just move inside the block/ext4/etc code, which would
be uglier, but whatever.

-- 
Pavel Begunkov

