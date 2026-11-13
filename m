Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553724;
	b=eAr+jeP0YyE2xSvth3TLhdQoICZ977EVT0LSOEzjln5n40rrHq/AZAuUgxLDHWyzdieb
	 LpuXY19BuZllDJFfDpFajB861hipHouidDOrvjD/1rhewRiS+MOqOGpo1cUsyammFAVR5
	 /quSx+Y8CP69HLza5z+KOhunXxVPC++BiFxMphhPWJ/yPD4KTjzWrs2UwuL1SrVS/hgIO
	 vav2jlgapeMiDVBuXvd5IV4b9aa7A7Xx12Ws+O/pm6uyZ/9H5SbWqAG0K+2XsnY9jkC+s
	 bLUBnkDytCByP5UYblNX5StD20sTAleAP46MU6yza/jFJnPPahziFbww++eSBYQQ9Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553724;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XYDjtxaf0lVfH8OsewVAiM2b9d3+k+o70NuMLB1ofvM=;
	b=MtP1plZEpzONEozktPd3cJipW9GoKeProQefJMOwA6Wrp1BmQZINiVcxrDgvEsIF+e1V
	 YkRbtPdWE5NRnpzLaEEa96kf2oFNZ4If+XDo9PTRWGOwPt+jZZbWEJSxNBlTxnkRuHrAR
	 4fzipnXT86u2Bsi82FIcOrLXqe+nqF0+EGDYp9mTojlP6mbgQ/p4nMOamOZZLq9Jqyfs7
	 v2zGQP6WCDzy0Hp6c5r9sBcwgGlWdnAgAQnyAxmeNNWtBQ6FsqEx4D8+LTPVV6a5V3xLK
	 BVRimB0o5HEfPyBpxwHC4BJ3DkRkubZzMQQIiA5bkj122n7vio4ATQiBESm7clSDh8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Og0Gdirg;
	arc=none smtp.remote-ip=95.215.58.19
Received: from mta1.migadu.com (out-19.mta1.migadu.com [95.215.58.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81972606A8A1
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 07:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81972606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Og0Gdirg
X-Envelope-To: linux-media@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CjYG6lLCB1BYJrLcL7BR63FCu2vQ5oxiLdcSaVMwGGM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794553721; v=1; x=1795158521;
 b=Og0GdirgiW0AJtxt7oGJ07VLbw8+sRWSKE2NEOI4lZcL7S4iJoMFw1LSb2a+qpOS8krcn8Ek
 BcDTgAG0DLCYfWO0wkYKq1Glqf6hpSpX4Bvg7zpGjw0M768W47l0FvXzSHCnhbuGRamQdrOCT3E
 97xeAo/3WPtOdFXdC6WMXsCM=
X-Envelope-To: linux-media@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0eecb32ce231a7d3;
	Fri, 13 Nov 2026 07:08:41 +0000
X-Mizu-Trace-ID: 0eecb32ce231a7d3
X-Migadu-Flow: FLOW_OUT
From: Mengmeng Zhao <mengmeng.zhao@linux.dev>
To: Christoph Hellwig <hch@lst.de>,
	Anuj Gupta <anuj1072538@gmail.com>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	christian.koenig@amd.com,
	Philipp Stanner <phasta@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	tytso@mit.edu,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	asml.silence@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Li Wang <liwang@kylinos.cn>,
	Mengmeng Zhao <zhaomengmeng@kylinos.cn>
Subject: [RFC PATCH v2 7/8] dax: refuse dma-buf iterators in dax_iomap_rw()
Date: Fri, 13 Nov 2026 15:06:20 +0800
Message-ID: <20261113070621.273953-8-mengmeng.zhao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113070621.273953-1-mengmeng.zhao@linux.dev>
References: <20261113070621.273953-1-mengmeng.zhao@linux.dev>
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

From: Mengmeng Zhao <zhaomengmeng@kylinos.cn>

DAX copies data through the CPU, so a dma-buf iterator has no meaning
in the DAX I/O path and must be refused.  A DAX inode does not get
FMODE_CAN_DMABUF_IO at open time, but DAX can be enabled later, so
check per I/O.

Signed-off-by: Mengmeng Zhao <zhaomengmeng@kylinos.cn>
Signed-off-by: Li Wang <liwang@kylinos.cn>
---
 fs/dax.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/dax.c b/fs/dax.c
index 94ba41273347..84d24db5ed35 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1752,6 +1752,10 @@ dax_iomap_rw(struct kiocb *iocb, struct iov_iter *iter,
 	if (!iomi.len)
 		return 0;
 
+	/* a dma-buf iterator has no CPU-visible pages to copy through */
+	if (iov_iter_is_dmabuf_map(iter))
+		return -EOPNOTSUPP;
+
 	if (iov_iter_rw(iter) == WRITE) {
 		lockdep_assert_held_write(&iomi.inode->i_rwsem);
 		iomi.flags |= IOMAP_WRITE;
-- 
2.43.0

