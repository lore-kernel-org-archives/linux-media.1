Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572008;
	b=Lgxw0K7u6OxrcSVtqclBSY+7csyCR88piuA/PHxXkyttuhatrKhJgd2pIMebSHIqdFZE
	 T3HkeDDIT1E7wvMts7TzN7ZcoymmLnvtVpe27hWpwYgbpTNqQmDTQxdr1uKWHsiitFEdb
	 C1zN2jqY7eYh85dDITRwkw/bvTgbocqZVF/qJP6fK4majikfeThyE6wnNZHNFdWgEiSzH
	 PNAX5+wGEBDAfrL5aWFwtX8SlWa1Aro9rOwI0dRyeSydcWIwPgpNWR8sGaWSHb5ny50gX
	 8QmwHbfTsyb7T5cqjqhls0GhrGYhvreDXP9j7Cs/Svi0RF+GJ8BexvrPJ+Dg+LlmBkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572008;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=xMVQUpjXKvmI0ruWsNcHB6bYALlWPg9I3zEcb3KEBoY=;
	b=q/azgBZTR5u7HcZySOH8BjJxvmlkTGAWF3tGOKERqeKndGSInYJAOfPyBkVEuHECzy15
	 1RAJmMrBTkTxR/Bo09dsaiCuv/yBzUmQXrtyg1t0s8Uq5hQWiYcpfZ/ITEX5gnA+5IzS1
	 A3T4AWXBpxvrafnkiFm/a0SrIny83cmQXoH/qTITcUxQhRe1Ej+Duz+8K5VJtB27Bqvdn
	 a/y7DCcshdZaUw4yEn65JAq5eb5Q3UKaPoP7h00OoohUXR/q/BEvfi29+2NG7p37w9FUt
	 SirR0v4FRERxbEGar4nGpL3g5CcrXU3kO4T9bUz9BsmH9St7/bBS/Ju50b9hFwrhXiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=invisiblethingslab.com;
	spf=pass smtp.mailfrom=invisiblethingslab.com;
	dkim=pass header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm2 header.b=eRqk5ucd;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=yi3jefSu;
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C533C606A326
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 08:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C533C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm2 header.b=eRqk5ucd;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=yi3jefSu
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0BA5E1400127
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 04:40:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 21 Oct 2026 04:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm2; t=1792572006; x=1792658406; bh=xMVQUpjXKvmI0ruWsNcHB
	6bYALlWPg9I3zEcb3KEBoY=; b=eRqk5ucd/jWthtisPboG7tA+Z2ETXvjIXQL8d
	J9P4pI5XbfxMMJtksD/wqUwIojf+Yu45s2tKSY6kBAfZduByo/Bi9qREI72kZwaR
	JmylokwFe9vkdsTl4lLoAH8/Ms0DIz/p21dfS2KRyrjlQ5nRIqT1eYdT/TLGmt/O
	08jZ8MDirPHUbD38WhJ/TZ2C0HiXZfKjlbPcyG7wVY+jicyv8YdewMV1RIP9owXi
	7t3c/rIMWt79BTEIGX8fwr9bU3PkfHXqZo+Y2Ar7DtFrMs8HpFDPrGUIMrp5LoBA
	fwXNKpMEuHf6Od4znYxgTH8XKg6K7tbPmesPfUf0cLgNMHFkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792572006; x=1792658406; bh=x
	MVQUpjXKvmI0ruWsNcHB6bYALlWPg9I3zEcb3KEBoY=; b=yi3jefSujg6tJjf6P
	KGuM/5o2IO84LU33hyeus2lGqcY3+GqUZwAPVO0lwnCW/cVPt/e3gxe8Ae5ZbdKa
	1+dN4tuAddDv1/i7hkfYXGYthOvrAHSLgYAz3FxxAChsfxbo5JmWyZnFozar2gjI
	97FP1exz96qVScfvHPZCet90vuXt63o+JQF8VvHnFPC2S2EIMzsh+b7BgfxyEwVu
	jMquBumXWY2LXpjU2kbcMS/yJNh3WvuLqqHMtkbgqjlVlJ+uCUSW1FbBRKqOkoh4
	/UzMHGTuNfrlZbKZVNctHS5D+T2TanmDevmyHgEKkBePj5EwYB4WqRjnwqOOuIhc
	v6Yig==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792572006; d=invisiblethingslab.com;
	mf=PHZhbEBpbnZpc2libGV0aGluZ3NsYWIuY29tPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:HO6nr8QtoL7h/GzevN9fxraKs1kcLgavloQiYnAjxrxFJ3U
	6SEyx7xO4iTygUuPe/tLzZdh/RzmUacZIdJRGerTwok8NSL0D0QBIscn1CDU0wfZ
	gOJpaaWZeEkoWtwOS3O6t0e9873UXeOVvOsHhon0evhwLfoFcucvDD40PHf7fAvZ
	yolt5H6WH96PvWtrPiawmtvyW649jrexq3MQ2dn8RdiZvF6vHw4lxVU0reGCGs1G
	2t0ZA68t77gLFhOCIHZpVKZQzAPTFpp7oJgDXFPAUjGiXejKOetgjsHefeebkFLK
	c27tZ7eXcZUdg0jyZsLt4z6AIAGBK40/PrdsYeg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:C+OjhbtEAAMz+jfi8cU86N2jb+xlAeOKlCf30gkLUeM=:K5T+1gXaUOXLMPNEb7Txe3C7loiSIpyUXBIUR+GpJog=;
X-ME-Sender: <xms:ZnrYaq5sDAONKap0qqkaELPRiWYDqD1IyfQktMrNS8HCLxPu6H57eg>
    <xme:ZnrYasGqyEy6QYPB0hTxDbBeS0KFfFBmA_6Xs93UA2_LO803zOrRECUUJVBSWi_x4
    jRs7OQjYzyThmlVzLHh_OfGL966pssxp9mF5BOXlnZTbsJmJqxk>
X-ME-Received: <xmr:ZnrYalDcQEzvb6uDFOGK7RgfZxDcdA0QCqXQM8FMBLzJAHvhLSSvVvNfxuxE3UVT1o6G9JmTJZ2kxsC20lLYa2Tvwhccg1kbHK8-BU5IMoZIT7zHAIyfSYYfK-8MhQ>
X-ME-Proxy-Cause: dmFkZTGSPTivLdJWCaPLLle5eLPBvgakeO3zd2AMB/BU5455+T1OAKKSIhSqLryWruvITu
    mrLmxcflstKefapl1Ouzo2H4SO6sQnsedZ1hl/xGoBL9IxZgDDoVMiwErKhDoyuF+Xg+to
    LpfQSDO/RT0uhf3t1vZYA2uv5U+VJxZ4bpF7a+uyUqas5EkZyUEDPGXBTnO3Ja44B1OIPe
    aPm/oEDN+YAsPNfM9yYeNvJcF2SWVW+eYC3NiGiISVLTeLHOUZ2Pzq+lVG09HQ+pwoD0xq
    t0PGp5ul74g6LPvVLuqNgawivJyrFnoW/txXCXGrVdGm0fHnRnVBgZOHvt395cxvEVBupn
    zWaS2CMpgy4oQ3cUS5OapJfcI+LHGiplXNhK5QRKv//Z7BE5XY1dLwxhXYkBzoG7wAdFX0
    PuoTYWpcWajraWqGaSUya97ElqktEzRWqClkcsdBkE2CdgIiDbr77w6YoAGNlYmenVsp5x
    CtFVRKsff5hmcg6Hl9q/sC6F24870s4UaORTAbBFJgiRwzSs9xzITLe4N7Mu7x43xaDvgo
    1m+agWgAUevu33RifRJgdR8yemX4zQ51SxqfEnLc3QWOVUX9LanpYUoykCd27FKmxoi6xZ
    C2DOb91hQ3xnaGv3w/u1NBYNTJTpWM/Vq6Z9Yt2C/s/u3oZ51CAovNsmFFkg
X-ME-Proxy: <xmx:ZnrYahw0xpkqnskZ-fQU1LJNG6Eopjw0IK8nVs7cpLjMHGMqa5e8UQ>
    <xmx:ZnrYap6bU9XiVNrqTC8UJciPKy_6g3mb8rrL9k2ZHbKY4mg9jg-eNA>
    <xmx:ZnrYaiwJ9mIMCODnzr8-vRyDq7De15qSnN1c3MQoJdT6c0JblSaQtw>
    <xmx:ZnrYateKWptfrBvVo3MroukcdY0V5O5AO6Fy7IDA0KljiXDX9RsKag>
    <xmx:ZnrYagsDzsyfkAQqZ5OHzMlBA2RHpXMMTiuZhFu5C-StSwYfb96GFg4v>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 04:40:04 -0400 (EDT)
From: Val Packett <val@invisiblethingslab.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>
Cc: Val Packett <val@invisiblethingslab.com>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] udmabuf: Increase the default list length limit
Date: Wed, 21 Oct 2026 05:39:12 -0300
Message-ID: <20261021083933.1983894-3-val@invisiblethingslab.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021083933.1983894-1-val@invisiblethingslab.com>
References: <20261021083933.1983894-1-val@invisiblethingslab.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shared memory buffers for software-rendered GUI applications are often
large and highly fragmented in memory. To get a shareable handle to such
a buffer from a guest VM, a virtio-gpu device backend can use the
UDMABUF_CREATE_LIST ioctl with the memfds backing guest RAM and the list
of guest physical pages sent by the guest driver. That list reaches 80K
entries for a maximized window on a 4K display!

Increase the default limit to 131072.

Signed-off-by: Val Packett <val@invisiblethingslab.com>
---
 drivers/dma-buf/udmabuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 654ebe7f6b3f..dd913f9f3b06 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -16,9 +16,9 @@
 #include <linux/vmalloc.h>
 #include <linux/iosys-map.h>
 
-static int list_limit = 1024;
+static int list_limit = 131072;
 module_param(list_limit, int, 0644);
-MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit. Default is 1024.");
+MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit. Default is 131072.");
 
 static int size_limit_mb = INT_MAX;
 module_param(size_limit_mb, int, 0644);
-- 
2.55.0

