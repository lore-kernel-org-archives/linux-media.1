Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048AB43E9D1
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832928; cv=none; b=oSvuiWm7HZUjN/wAdt3guc81r6qrDBKSqjT6XvM1TBuG7YmuXYVgcARVf5xL3CEcL+Uf2ZVb0HbCb3dAsaL2nF/Dxz+5dnRXIUUEyrolvHNIkVgBTzeddi+SzD8fq9N6El8dAMjB7vMyE/ACtd6hYt0e3hrhJQ/klgyRWnlKxSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832928; c=relaxed/simple;
	bh=SD2jpuPrRshOPjZPDhOULtKF/IyS30DOHYKRJQ1eYRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dByDcOCCtsKdQiy4BGPsEQaflsMRCJ0Fzje4oK3bQz6OJ4tK3WlSDalDlQ3+vg3cSsSCz2ta2TemZvqIJrEuU71h7qo9Z8Y8XNefxI/jelgod0LkPCaarDhNhQdiK/e7vQik4KicWIMBD28oKPL2pUIT1YdvCeil0VAjQ6N72uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PA0v0brP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PA0v0brP"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8486ac3f347so753605b3a.1
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 01:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785832926; x=1786437726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2I8sdYMfYJjOc8dSgSE9HfEVezQOKs2ggEWu0ibP00=;
        b=PA0v0brPxdaG3MEMmRscI/ZEK7lPZvVtloK+bV3z/F9OTMQIQYQK3/DIi4u1GI7qFN
         loGlkGRq//5VBuMSUY8lNrmwfGcdY4Dc3skR5sZU+/7VijefGzbiWad1oWBUhNiRIcBR
         cATciU315li3smb1VkkPjTv/WGRzNvjMRooeuj3M8NegTKCk5+CniXtcBKbrwzdX5Ppk
         AEZ81m5gD/uKb6SuQr7oj0ccxoRAvDdPkdHbgbpQj8hdWtBtKR3OCIc+XDmV+K49o6JU
         g8ze6gtlfWfC4/AeGKb2PunLoQvQYsHnEgqI3aEJhVqD8xaegcnxUAv7aD+3NAQ+DF75
         YToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785832926; x=1786437726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2I8sdYMfYJjOc8dSgSE9HfEVezQOKs2ggEWu0ibP00=;
        b=a7gFtlAAzW8LEbeaoR0dQ4z7r+WuZZkX4R8jpDOTYhzFz2c0glfftLtv2BYJcKnFDg
         gP2f6KuhqLCDrM82CcGNygKLEhORuJQaZmOPI3t/wUWUEAmmJPrylMUXOcgba31IPSVV
         MjkULRqeHgBxZC25wq6gpQiNNwKIqENUc/E8J+g8YG8Y6xFD6nsNntZDRofYl6Z9o5uF
         TXwjRI9HYYfqVEKtHykA/mlBgC730tlUgbzc0mwjP950qs+MNFclvc6FLIPkY1fijjYP
         lnN76vD/qBGkUKJa2WBvnenGxQ13vKkKMK88/jGXUT6xPkGRa8u8BmW0PGZSK3bEY26r
         izSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7QPzioshsw5L4Dbk6/dDYEvkk8F6Y+BEA7eu9vRSZJGfiz9pYgEn9dqvrKI9Eivi0ax0z3dh+Uq6oxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuQ7yLBSgG1VkSoVZqiMX9SXydcl5dHZJSnWYgp9d1VAD50Efr
	UE7d9Q8XAfKpZgGp7eRBXshDumJVmUSswK+m/RfgnDN8+LSq0VaEveNq
X-Gm-Gg: AR+sD121VZH0++c7VtoZ8uoSdLd+hhLlRuq+Rp4lrBTchVyC/4spQSMo+RUincwrsAK
	0qLR6kK6JIm1KyAwLlWzyUf/REevpzbCBjRsft6/JaXPdRYr9c214/+bfluZMu5w6WGZ2xwSDDS
	0X1RtTKX4iOGUbqRJpJdfIWCnCMjpNdo0+5e1vcsvPGabPaSlxacz/KEGJ1MLnGPtkxWd6OLre9
	bmzHg6ciXN1td3HfvmY74p8tVIeL75Q3IJLZSiUTjrU2n9tyYHCRFViAMqTu0b77h3tw5ikMy8N
	l4Gim0xjUfeZWb/1FwSGFNOxd/br8lRYgo++V6G4/qqH4RbBEIdFal/31zErSwyPcJK4ZePKaNw
	NMiC40reYU1Cg2MOMpRuNDCVMmwSlT090CDsVThcaChT5faD7R6E2DsGJy8ccf4D8cUwbELwVhG
	NfrOcuTUWi7TbIl/ymSD8x70XuJBK7kHqxHXlm0Ua3SJ98Rvgo3Z+h1kgUFHB7dqf9lFxa7SMnt
	ZHI6pejPum9aa3+Q8kXzfErvwbNXkpA27uZvwlg48G37C1yqvQbDAD+y28H13JLao9mP/ftHlkO
	TkX7MrBy4uYOKiv6P0Mq
X-Received: by 2002:a05:6a20:9188:b0:3bf:6c27:38b with SMTP id adf61e73a8af0-3cb6c937c3amr2601207637.29.1785832926102;
        Tue, 04 Aug 2026 01:42:06 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:541b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39ea0a73sm4753273a12.23.2026.08.04.01.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 01:42:05 -0700 (PDT)
Message-ID: <53c9cf90-4284-4b6a-ab2f-1686c7461bf8@gmail.com>
Date: Tue, 4 Aug 2026 09:41:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/16] nvme-pci: implement dma-buf backed requests
To: Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>, Jens Axboe
 <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Damien Le Moal <dlemoal@kernel.org>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, David Sterba <dsterba@suse.com>,
 Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev,
 nvdimm@lists.linux.dev, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org
References: <cover.1785596451.git.asml.silence@gmail.com>
 <CGME20260801155005epcas5p4ecdcdf532aa2c2ff4e94638eedaa435b@epcas5p4.samsung.com>
 <9e3dd1b2d71dc0f9bd556b6a6d6e48fb6a8d727b.1785596451.git.asml.silence@gmail.com>
 <c4cec417-24b8-428a-853f-4e1ff1e29a6a@samsung.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <c4cec417-24b8-428a-853f-4e1ff1e29a6a@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/26 08:29, Anuj Gupta/Anuj Gupta wrote:
> On 8/1/2026 9:16 PM, Pavel Begunkov wrote:
...>> +	if (WARN_ON_ONCE(seg_shift < NVME_CTRL_PAGE_SHIFT))
>> +		return ERR_PTR(-EFAULT);
> 
> This should be 'goto err;' instead of a direct return. If this ever
> triggers, it leaks the map and already established sgt mapping.

I can change it as I'm going to respin the series anyway,
but it doesn't really matter here as it's a warning and
shouldn't happen.

-- 
Pavel Begunkov

