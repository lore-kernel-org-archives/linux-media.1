Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4755544C4F8
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394066; cv=none; b=ifQTwzsriimHdjlq/JRerNlM75a1KHPqLDs7zq0gBUsQOR/aVOwWvWgh9Mwq48OA/NUscUfu8GV+90U2ESDakH8OhODADiYQApNYkV0wGQpbvMUpZKcz9iGNQpgmgBUeNoRgto1Oynj0iW5K3QzgVfctywJhNOzW8McxJSkZrmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394066; c=relaxed/simple;
	bh=FNU42YhptCFvQFCc+00g64enrO+LxrGZvwpZ6quqXps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M/VjPnz7aK1K43PbLz6/NJkgcHxIWo0C4ZtpqmEfuhO2IZNfQLMeVz3LK08Hjc5dzU/a/8BmZrH3UQ6uad2yPR9dUBUn0xpMlvrDmGNWeMVkdvDszqkhal4E7lCn65hdtwY26jGJFS1LqIFbSnQW9KJZJBvR735Uy/tpsGgmWEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dECw3kAk; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dECw3kAk"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df4f540ebso856126f8f.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 00:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792394062; x=1792998862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvdzAe+ZkLnBBtbCTReTMkAoyI9rj6E82u0uZ+VglJ8=;
        b=dECw3kAkvUQJlAOmBSc5AnwqAGCopbwEiZBk9r5ZqORyBXU2VtjzV+wMXgZJTYEVWx
         QKYG7+sUBCPkpXecvgE4y13xSocsccvYVn8s6giajTB4xheFxeW9dW1qFZHr8yfUUr/l
         LTJJ8KCIKBfXMECRWp6ZChn3cU7G4LbjS4g3O63CKrbcyDkiL0kFMzsZKFRONw3UqvPO
         40Z1TQWkLsFdhOR+5d9Ooyw7Gwfz/w/9/l8ESN9Uf+DrmIIzlZ0u6AHL3f9uVmjieEsj
         8BkdW94XMO1lUhgF5+yesq6OBlASQYIoG2+HrLfa5aN3uhqbafoXcx9Vb1FgGXxnZfI0
         ON1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394062; x=1792998862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvdzAe+ZkLnBBtbCTReTMkAoyI9rj6E82u0uZ+VglJ8=;
        b=szKcqMFHTqEBxnJjwAAa+RY8olAIGYXn6XFqTEhal0hAH/iW3dkv8HuVJz6TNH/Afe
         gpIXOz0XDhMOPmvaAyyNlSg4TljXkFsY9QsKL4itaQm62xH89Bergv7xEANXaxS0/tja
         COn0MmrspHTWVXm8jiPEZVtjrv0caJeQ88OAZibEN3vFRa+i5y7dmn+yWqjgrJY/vmqN
         FW9voqxoft5v49Goa6z6nlpJ+vg8+YUIr6giJs2PkFIcYyS5GVMMgOIhT/FVRXFpwUvi
         haBbRewJBoYnNTyoWQ4gZSib5jXnuhmRHLqWUo1u25VCzg6FH8XqO/NCjMV4tW5vz7OX
         6xRw==
X-Gm-Message-State: AFq9FYLyb9ff/Ae98UqecME5MpZiYr5iqeHPkzPZRJXe6TDVeKZY4W27
	h9L2tmfckhVw5EJAkhfo2o3asnEDNvf4Iu2unhTvGEHHHqQlhqxGx23wXmqS5gVu
X-Gm-Gg: AYBFou3Fb0KU620evVbZlxEuOduYFglMD0itIyToSMmCp3zW9HEJ034mbwQVjQsp49T
	rNa563rJUmUvslK4exPXolFQOjIZSU3R3oZcIEpZzupxZNdLACVNIF+nq9HTu7+cg9/EGDMV6S8
	nz6gt6VfdzEqx1butCzW9hyriqfxwib214Yms8rnyGEmYBGTO1UPoU4/qQnhyZkzoNmfVZkya4G
	Jccs1i1mNkZH6+JBB2ob2AaqeF2Ur0hyH2+EXjG49XwaM7V0wTHZGint+jwTnzuVJxWMAXLABUj
	dsyZEuv1O3VUvpXThUkGS/x22juYtPXqIwG4zPMYO6mtsxhAPaEeGlgDLwprWqhBkOGHSSUvZic
	NqUlgrh6BAtWL/pTTlU5m+KKdTGcLXmmyUFEIcEJneXSmz0q17+Wk2JfAkobB0zq4L+enxU+qXM
	+eaa5iwiKR7O/W1plQEi1WCYIi9ZA2i73f2AiyqnJrixDGiFyQG86nELRNHmYS4eowh8OSROusr
	qEHejOTWRbE23b0KeXz81047GeaxBK+O/pkpUJWqc8LPwq9nHM3/uvBz5A3DvssvpVlZ7RMTUWX
	U5c2UM8zBdyIISY2XbtivjWwjJ201hbdERXrZGaWmZppddWr97Hyiy+7Gz1i/msEfwbCA2TajPJ
	w
X-Received: by 2002:adf:e28f:0:b0:48d:f7f0:327d with SMTP id ffacd0b85a97d-48e07fc3ac2mr9376404f8f.29.1792394062160;
        Mon, 19 Oct 2026 00:14:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4e0-4601-c43a-536a-04a3-af7d.310.pool.telefonica.de. [2a02:3100:a4e0:4601:c43a:536a:4a3:af7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm21559338f8f.2.2026.10.19.00.14.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 00:14:21 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomasz Stanislawski <t.stanislaws@samsung.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 1/4] media: videobuf2: finish prepared buffers in VIDIOC_REMOVE_BUFS
Date: Mon, 19 Oct 2026 09:14:08 +0200
Message-Id: <f2258d73562e0ebf2efd793b646706ba0dacb2c7.1792392288.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792392288.git.kmehltretter@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VIDIOC_PREPARE_BUF leaves a buffer DEQUEUED after calling buf_prepare()
and the prepare() memory operation. VIDIOC_REMOVE_BUFS accepts that state
but frees the buffer without calling the matching finish operations.

With VIDEO_ADV_DEBUG, vivid reports:

  unbalanced counters for queue 000000009fa716f8, buffer 0:
       buf_prepare: 1 buf_finish: 0
       prepare: 1 finish: 0

Finish prepared buffers before freeing them, as queue cancellation does.

Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b0a6084f17573..460eaf4e82f78 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1746,6 +1746,19 @@ int vb2_core_remove_bufs(struct vb2_queue *q, unsigned int start, unsigned int c
 			goto unlock;
 		}
 	}
+
+	/* A buffer can be prepared without being queued. Finish it first. */
+	for (i = start; i < start + count; i++) {
+		struct vb2_buffer *vb = vb2_get_buffer(q, i);
+
+		if (!vb->prepared)
+			continue;
+
+		__vb2_buf_mem_finish(vb);
+		call_void_vb_qop(vb, buf_finish, vb);
+		vb->prepared = 0;
+	}
+
 	__vb2_queue_free(q, start, count);
 	dprintk(q, 2, "%u buffers removed\n", count);
 
-- 
2.47.3

