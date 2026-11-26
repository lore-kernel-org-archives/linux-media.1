Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705862;
	b=Rc6CjJInEhzgUsRB6hXhKF32iYCTXo71Hao+XOqXyeDISjfzV6Y1MKAkStE2CnAZVjwt
	 2NmFS91B3IgkzYnTdTj8o85rMDzYHsKOgM2F3gcObBdINToe4hB4uEVxwBujloEgIsyl6
	 ZnKWg+shxus714GwN1DNOmufw7EACQASETHVscZvdTPHyPo0o1AknPWYKKzc28/X4r+t/
	 XFe1ZOeL1A+kppFlFrAlVndqOiuAvQz2OaHtfksC92Vn7z9kTrrAp9f9yK6SPB99WerUd
	 vdH+rzafKONbSmpP2Mfu2XaNeaAJ5bc9rZuO/wpWIqTqjyFJmkeZHo+ci6FwZiAQpDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hmKc5OL+Mgz6BiLPRBsvhxg+w0u2ZayYKVKGlsKtPPc=;
	b=M2MaZTrACKaOrfzTWvyNHqI1/ZKTr9sCv2A7m1IBuDlF5oQykvSASwhy0M5YYo2xFpcW
	 n2ZHgdpTGs3XtzVpfXcootqJZayPIfhly/su0WXb9zfaEniuOmLkaMfyXTCtzOW47frRH
	 XTMGLP6ERwrTYHvNQHmeiFYVkQc+p7ZzuEG+xQtfzS1xl+KEohwgIpfUE/+zlGBM1PJo2
	 3LWQ17yDaprbYNeqO44PMbCwnj0ZdxQd50cZHcFQgurGFTtSuAhbEVttm2PkF5OJ4V+Dr
	 uPC7LLu7kX5S1+t7zzM2RU/8JP7Z5Fh6Wq5OMgCi01fzIU3rWxb/2BOavKXNBg/VV8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=2vNX7mSL;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEBC606A31E
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 15:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFEBC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=2vNX7mSL
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c51a02ad3acso333924466b.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795705860; x=1796310660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmKc5OL+Mgz6BiLPRBsvhxg+w0u2ZayYKVKGlsKtPPc=;
        b=2vNX7mSLMS3ZNWe+0DciQ0V2qhoDcCVY/a39ikrSq3nn6C8X+RwcvVFKT7HVSOhA4I
         5ZxPAKArax4IHH/7aVWsuWG6Jks7NGNmtExFNFyHi6TDVsHDAoaYLgNyL763SHLrMKLC
         +uT2UIUMoOvSnFGpG+BqL9FkexuYvKBC0kDL+ygJYbnzsvvtT8jnNvmAn52I9G+r/J+R
         vP6YquxG7XiwHez08tly7eb2HGHX0hRGs3bOoMN8dU9CZGbtzZI7en4SeGmK00NcZt8X
         PAA7DyqCrcf/MHTtj3uZmRHZwdnnZy80T1UFS2PH56kmM95WUf9/dvzKjA93ffOm4ZI4
         tKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705860; x=1796310660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmKc5OL+Mgz6BiLPRBsvhxg+w0u2ZayYKVKGlsKtPPc=;
        b=CSpG4r5o2y2cTSyvnumdG3v/fvCY9pVA1y206KyeOtx8Pq8qCWnNul8N0jXhgt8RYI
         peAMt2FqVqS1ShfTQ11boK0XCg/bXBvblAQ849SZXcE8m8llWw7JDXpjX9cyNnirZyuo
         cn620/Q70i3mfRte7B2pJCA29w9kCjQoyNKutY7RG9OKzaFTpFDbxC0j5sDa4mbuxZ3r
         qmk5SLC5XNskBFLwylEaUGYa5lZC89LX3H+v2dnqTyMl12lEfIVhzE+/0YHxq5TPNZx8
         MKa3tVt78HeEpBF99oEstETAYlmKaIP3RocvckFsDEZluvo30E/U5SPcsWZvLwjmQHJY
         tLuA==
X-Forwarded-Encrypted: i=1; AL+hErEcZLKSTw/K8FkYLg4lDkAVxp1Vt6m7c8m2eZ4P64pU60hJVzZrVPJhuOUuLuIg8OirRbx7lMpiIub8ow==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kfk3N2YhmCstZlzmQCrq6vjD684zd/mxzUf41y/cgghwNixKK
	DXBqqDLwEVl32d1J8kTDiyJ3Wco2QxSEQwUVIxR1cTgz51ClQfrITluNFY+j3o2NFlw=
X-Gm-Gg: AZFdTZfqL8KBrYdwVz7BBNlDcO4z48cSGMk1i9laI28h1R79Zs7JTruFjysd2IHuO14
	k8ZF0BSQLd3Xug2zoqH2fqSEahiiYN8XiPpRKm9QxGuWbrLvtlVxBwA+AXnxtGbgy6lRvsZGhmk
	OSsUV4mj2nJzct9oKLVxgx1a1s8CleyvYGHYBTf3VXCGqoOvyehzO5F8dnIezjfqHgZ/yXUh/cC
	U6IdUGXuNymlM+7ez+iPwnDs+X2F4mU952RAJchV/eXzGweYwMDS8dpedLkU5qBHr9BQETxeXHC
	Rrpr5ndPCYwGA/QH17GeiCYGJ5YP2DXOqiRcZmiCcJtjfOxFSEUACHCVm4qSAk1MgbnJN3ZTIxf
	ztXzYU0W0P5MJ2gjrogSKV2cvNpLzKA2BUKyNKmKjZyAjJBwVNd26MI9HlKS19UOpDgagR6tItR
	zi5J75LAET1XF+FQwiIvyeQTlGEIY6dQbIuJ1y8cckzGO4Dq3NGOJ1Sd6TlFioqhtn0optwZdL7
	Ah9UOuevs8yPpjG2wqxybMCDlrPlNrnQPuwvBb/AVrmZhrvGaanoJZDjkW5lAL6PVdMxwsd/wkW
	35j4PhV2SOhW8naMzbxwPnQXE6sKKb3J/RHkAydkX+9SScU6IyJ9J19yYK86NhoPrSnofn9Vfwd
	HlZNZGudEAQDDPxM99ivt6/CL2zEOO7FRm9myKQYpLebe2fCvV8264BvvsLfO1w==
X-Received: by 2002:a17:907:9629:b0:c51:536b:b23c with SMTP id a640c23a62f3a-c51536bcdf4mr1427126966b.10.1795705860333;
        Thu, 26 Nov 2026 07:11:00 -0800 (PST)
Received: from [192.168.1.104] (92-115-210-87.ftth.glasoperator.nl. [87.210.115.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec177sm767498166b.72.2026.11.26.07.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:11:00 -0800 (PST)
Message-ID: <37ecd4c5-e768-486f-a7b3-2e8a46e4d4df@fairphone.com>
Date: Thu, 26 Nov 2026 16:10:59 +0100
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
Subject: Re: Surface Pro 11 OLED: tested optional vddio for DW9800K (re:
 [PATCH v4 0/3])
To: geoca <geocausa@gmail.com>
Cc: sakari.ailus@linux.intel.com, git@apitzsch.eu,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <CA+7Hbh+=SOYBqqQN_z6869s54hE9QpKSr-mZ0+2EtdNG=DMPbw@mail.gmail.com>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <CA+7Hbh+=SOYBqqQN_z6869s54hE9QpKSr-mZ0+2EtdNG=DMPbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello George,

Re-sending in plaintext...

On 11/21/26 22:46, geoca wrote:
> Hi Griffin, Sakari and all,

> Would you prefer the vddio support as a separate series after the v4
> binding settles, or incorporated into a subsequent v4 revision?

I'll put out a new patchset version soon enough, a solution for this
could be you using a tool such as B4 to list my patch series as a
dependency, then you could just send it out as I churn out more
revisions until successfully mainlined.
Otherwise, I only work a day a week so waiting for me to finish might
take a while.

> Thanks,
> George

Thanks,
Griffin
