Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699105;
	b=3Awx0Yps1FWpb480aU8ecOjPm9uLZFc1Xo3LsedPh1Hw7ZpOx1Xkp4TLWYzBOI5CGpnb
	 gbJthunNzmi1ZETc16/Ro+YfEEwbzjE5U5EDn1LqHEYu4DbStauecssuF+WsMA+YlktT0
	 PZ2PeqxIfTbuAdxER7hZBOw5qL18LcK0NqgytL1kdMYTXZI94+WwTQ1ZSfGVY96YpnrT9
	 nK2bPm9G5VxgvEtcHMzjCKgTdA2tdi1wwP195MTG9jePaT02gKbmj3lP0Oirkw4V0r1Lj
	 To7F5f8Ieztm9QiA7vi2vYMHOoQqhqI1TFXFTODndak0gtlfpfe12AGct4YGK/fcYDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699105;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=ay+/koHZ1d7dLfNHCanhMmpzutMDscxmM6H/W0Ew73U=;
	b=cKuawDh/Fd1wjrWlMiXNcL3O1lDse2s7b5FwuniKGQWmCZJGWikA6qLuowItYpaB4fme
	 jS8ytkTxPNdL2REfuhxLGD17//AkKWyG7GUUsnntBhUZOMSKHl2kn7xh6cC48Y5dXmssF
	 GO9zdTfMZ4Tg6UhGzZ24wgFOcthBiDHA0sJ4CZo3IHjDqtPSVJhLdmmwYUOHU9WAbYssA
	 hwVMY9JcKb3rg/QV48MEMmFGJjyFp4lQfui/RUx5AiF1VrcpR1DM20m3qxOpug0XwSYrQ
	 GMktinO4Xyg+thZa4io1DeTbLzB3N6aJXgFLNLckMdBx/qyBWECRP1IYnCNxSFpAOmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NLensgO9;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF39B606A329;
	Thu, 26 Nov 2026 13:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF39B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NLensgO9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=ay+/koHZ1d7dLfNHCanhMmpzutMDscxmM6H/W0Ew73U=;
	b=NLensgO97SBV1gE7WeiOIW+vvYL71ZJypBf3kBMjKEDbpiaBNCey9uxliKlNqg
	2kNEYCzq51fcCLzVf6frRbgsSxS8xGbyCX/gVf1BHf2nnwr5r25qYogjNFPX73nq
	vCnxOpORpEHb/QJJoRysxqxePlz330gmPHpZ6/Tpw/MEI=
Received: from piano.lan (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCncjd2MQhriVuQIQ--.12487S2;
	Thu, 26 Nov 2026 21:17:47 +0800 (CST)
From: sakimidare <ssmzhn@163.com>
To: linux-media@vger.kernel.org
Cc: Xilin Wu <sophon@radxa.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/5] media: iris: allow larger capture buffer pools on HFI
Date: Thu, 26 Nov 2026 21:17:35 +0800
Message-ID: <179569905554.642669.6264413991891425508@163.com>
In-Reply-To: <20261029-iris-va-fixes-v1-2-44a2783f782b@radxa.com>
References: <20261029-iris-va-fixes-v1-2-44a2783f782b@radxa.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:PigvCgCncjd2MQhriVuQIQ--.12487S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7sqWUUUUU
X-CM-SenderInfo: hvvp6xrq6rljoofrz/xtbC8xtHdGsIMXtnDgAA3b

Tested-by: sakimidare <ssmzhn@163.com>

Same setup and full test matrix as my reply to patch 1; all five
patches were tested together on the Xiaomi Pad 8 Pro (SM8750 /
Adreno 830). VA-API H.264/HEVC/VP9/AV1 at 1080p and 4K, V4L2 M2M,
and an H.264 encoder round-trip all completed without errors.

